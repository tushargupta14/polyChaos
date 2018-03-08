function [c,ceq] = ex4_mycon(x,sys_H,sys_M,simoptions)
% set input; see MAIN.m for details of simulation with specified inputs
sim_H = PCETsimGalerkin(sys_H,'ex4_ODE_H',[],simoptions,'u1_v',x);
mom_H = PCETcalcMoments(sys_H,sys_H.MomMats,sim_H.x_2.pcvals(:,end));
beta_H = calcBeta4(mom_H);

sim_M = PCETsimGalerkin(sys_M,'ex4_ODE_M',[],simoptions,'u1_v',x);
mom_M = PCETcalcMoments(sys_M,sys_M.MomMats,sim_M.x_2.pcvals(:,end));
beta_M = calcBeta4(mom_M);

%% using Hellinger distance as measure
c = calcMDCbeta(beta_H,beta_M);

%% alternative: using Hausdorff-kind distance as measure
% maxlb = max([beta_M(3), beta_H(3)]);
% minub = min([beta_M(4), beta_H(4)]);
% c = 100*(minub-maxlb);

ceq = [];