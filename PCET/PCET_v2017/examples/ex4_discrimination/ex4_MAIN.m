% This example demonstrates the discrimination of two model candidates
% using PCET. The workflow is (1) defining the models, (2) simulating
% the undiscriminated models and (3) finding a discriminating input.
% In order to compare the PDFs a fourparametric beta-distribution is fitted
% to the moments.

clc, clear variables, close all
addpath(genpath('../../../PCET'))

%% (1) define model candidates, input, and options
% system 1
statesH(1).name = 'x_1';
statesH(1).dist = 'uniform';
statesH(1).data = [0.97 0.98];
statesH(1).rhs = '(p_1+p_3)*(x_2-1)*x_1+(p_2+u1)*x_2';

statesH(2).name = 'x_2';
statesH(2).dist = 'uniform';
statesH(2).data = [0.01 0.02];
statesH(2).rhs = 'p_1*(1-x_2)*x_1-(p_2+u1)*x_2';

parametersH(1).name = 'p_1';
parametersH(1).dist = 'uniform';
parametersH(1).data = [0.92, 1.28];

parametersH(2).name = 'p_2';
parametersH(2).dist = 'uniform';
parametersH(2).data = [1.06, 1.33];

parametersH(3).name = 'p_3';
parametersH(3).dist = 'uniform';
parametersH(3).data = [0.76, 0.98];

% system 2
statesM(1).name = 'x_1';
statesM(1).dist = 'uniform';
statesM(1).data = [0.97 0.98];
statesM(1).rhs = 'p_1*(x_2-1)*x_1+(p_2+u1)*x_2';

statesM(2).name = 'x_2';
statesM(2).dist = 'uniform';
statesM(2).data = [0.01 0.02];
statesM(2).rhs = 'p_1*(1-x_2)*x_1-(p_3+p_2+u1)*x_2';

parametersM(1).name = 'p_1';
parametersM(1).dist = 'uniform';
parametersM(1).data = [0.97, 1.14];

parametersM(2).name = 'p_2';
parametersM(2).dist = 'uniform';
parametersM(2).data = [0.65, 0.74];

parametersM(3).name = 'p_3';
parametersM(3).dist = 'uniform';
parametersM(3).data = [0.57, 1.53];

% input
% Here, a piecewise constant input is used. For more information, enter 
% 'help piecewise' in your command window.
inputs(1).name = 'u1';
inputs(1).rhs  = 'piecewise(u1_t,u1_v,t)';
inputs(1).u1_t = [0 0.5 1 1.5 2 2.5 3 3.5];
inputs(1).u1_v = [0 0 0 0 0 0 0 0];

% define simulation options
mc_samples = 1e3;
pce_order = 2;

simoptions.setup = odeset;
simoptions.solver = 'ode15s';
simoptions.tspan = [0, 4];
simoptions.dt = 0.05;

% compose the PCE systems and write files for PCE-ODE simulations
fprintf('Composing System 1 - Henri-Kinetics\n')
sys_H = PCETcompose(statesH,parametersH,inputs,[],pce_order);
sys_H.MomMats = PCETmomentMatrices(sys_H,4);
PCETwriteFiles(sys_H,'ex4_ODE_H');

fprintf('\nComposing System 2 - Michaelis-Menten-Kinetics\n')
sys_M = PCETcompose(statesM,parametersM,inputs,[],pce_order);
sys_M.MomMats = PCETmomentMatrices(sys_M,4);
PCETwriteFiles(sys_M,'ex4_ODE_M');

%% (2) Galerkin PCE simulation of undiscriminated systems

nondisc_H = PCETsimGalerkin(sys_H,'ex4_ODE_H',[],simoptions); 
nondisc_moments_H = PCETcalcMoments(sys_H,sys_H.MomMats,nondisc_H.x_2.pcvals(:,end)); 
nondisc_beta_H = calcBeta4(nondisc_moments_H);

nondisc_M = PCETsimGalerkin(sys_M,'ex4_ODE_M',[],simoptions);
nondisc_moments_M = PCETcalcMoments(sys_M,sys_M.MomMats,nondisc_M.x_2.pcvals(:,end));
nondisc_beta_M = calcBeta4(nondisc_moments_M);

% plot non-discriminated distributions
minlb = min([nondisc_beta_H(3),nondisc_beta_M(3)])-0.001;
maxub = max([nondisc_beta_H(4),nondisc_beta_M(4)]);
x = linspace(minlb,maxub,1000);
y_H = beta4(nondisc_beta_H,x);
y_M = beta4(nondisc_beta_M,x);

figure(1)
plot(x,y_H,'Color','b','Linewidth',1.5)
hold on
plot(x,y_M,'Color','r','Linewidth',1.5)
legend('System 1','System 2')
title('PDFs before discrimintation')
pause(0.1)

%% (3) Finding optimal discriminating input
% Because the problem is nonlinear and nonconvex, fmincon can only
% guarantee a feasible solution if the initial value is already feasible.
% In order to find such a feasible initial condition, first run fmincon
% with a objective function the always returns zero. Then run fmincon with
% an actual objective function using the solution from step one as the
% initial condition in order to find a cost-optimal discriminating input.
% (For step one the recommended algorithm is 'interior-point',
%  for step two the recommended algorithm is 'active-set'.)
%
% For model discrimination, the file 'ex4_mycon.m' can be used as a template 
% for the nonlinear constraint used in fmincon.

% a) find any discriminating input
u0 = [0 0 0 0 0 0 0 0];
ops = optimset(optimset,'Display','iter-detailed','MaxIter',25,'Algorithm','interior-point');
zerocon = @(x)0;
constr = @(x)ex4_mycon(x,sys_H,sys_M,simoptions);
u_feas = fmincon(zerocon,u0,[],[],[],[],zeros(size(u0)),5*ones(size(u0)),constr,ops);

%  2. find a cost-optimal discriminating input
ops = optimset(optimset,'Display','iter-detailed','MaxIter',25,'Algorithm','active-set');
penalty = @(x) sqrt(x*eye(length(x))*x');
u_opt = fmincon(penalty,u_feas,[],[],[],[],zeros(size(u_feas)),5*ones(size(u_feas)),constr,ops);

% Galerkin PCE simulation with discriminating input
disc_H = PCETsimGalerkin(sys_H,'ex4_ODE_H',[],simoptions,'u1_v',u_opt);
disc_moments_H = PCETcalcMoments(sys_H,sys_H.MomMats,disc_H.x_2.pcvals(:,end));
disc_beta_H = calcBeta4(disc_moments_H);

disc_M = PCETsimGalerkin(sys_M,'ex4_ODE_M',[],simoptions,'u1_v',u_opt);
disc_moments_M = PCETcalcMoments(sys_M,sys_M.MomMats,disc_M.x_2.pcvals(:,end));
disc_beta_M = calcBeta4(disc_moments_M);

% plot discriminated distributions
minlb = min([disc_beta_H(3),disc_beta_M(3)]);
maxub = max([disc_beta_H(4),disc_beta_M(4)]);
x = linspace(minlb,maxub,1000);
y_H = beta4(disc_beta_H,x);
y_M = beta4(disc_beta_M,x);

figure(2)
plot(x,y_H,'Color','b','Linewidth',1.5)
hold on
plot(x,y_M,'Color','r','Linewidth',1.5)
legend('System 1','System 2')
title('PDFs after discrimintation')
pause(0.1)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
writeMCRHSfile(sys_H,'ex4_MCODE_H');
writeMCRHSfile(sys_M,'ex4_MCODE_M');

mcresultsH = PCETsimMonteCarlo(sys_H,'ex4_MCODE_H',[],mc_samples,simoptions,'method','moments');
mcresultsM = PCETsimMonteCarlo(sys_M,'ex4_MCODE_M',[],mc_samples,simoptions,'method','moments');

figure(3)
plot(mcresultsH.time,mcresultsH.x_2.lb,'Color','b','Linewidth',1.5)
hold on
plot(mcresultsM.time,mcresultsM.x_2.lb,'Color','r','Linewidth',1.5)
plot(mcresultsH.time,mcresultsH.x_2.ub,'Color','b','Linewidth',1.5)
plot(mcresultsM.time,mcresultsM.x_2.ub,'Color','r','Linewidth',1.5)
legend('System 1','System 2')
title('outer bounds before discrimintation')
pause(0.1)

mcresultsH_d = PCETsimMonteCarlo(sys_H,'ex4_MCODE_H',[],mc_samples,simoptions,'u1_v',u_opt,'method','moments');
mcresultsM_d = PCETsimMonteCarlo(sys_M,'ex4_MCODE_M',[],mc_samples,simoptions,'u1_v',u_opt,'method','moments');

figure(4)
plot(mcresultsH_d.time,mcresultsH_d.x_2.lb,'Color','b','Linewidth',1.5)
hold on
plot(mcresultsM_d.time,mcresultsM_d.x_2.lb,'Color','r','Linewidth',1.5)
plot(mcresultsH_d.time,mcresultsH_d.x_2.ub,'Color','b','Linewidth',1.5)
plot(mcresultsM_d.time,mcresultsM_d.x_2.ub,'Color','r','Linewidth',1.5)
legend('System 1','System 2')
title('outer bounds after discrimintation')
pause(0.1)

