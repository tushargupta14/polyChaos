%%%%% PCE3

clc, clear variables, close all
addpath(genpath('../../../PCET'));
y0 = [0.1743 66.66 1.83*10^4 5.05*10^6 1.93*10^9 0.867 0 0 0]';

%%%% defining the states 


states(1).name = 'C';
states(1).dist = 'none';
states(1).data = y0(1);
states(1).rhs = '-3*u2n*rho*kv*kg*exp(-Eg/T)*(1-C/Cs)^g - 3*u2s*rho*kv*kb*exp(-Eg/T)*(1-C/Cs)^g';

%states(2).name = 'u0s';
%states(2).dist = 'none';
%states(2).data = y0(2);
%states(2).rhs = 0;

states(2).name = 'u1s';
states(2).dist = 'none';
states(2).data = y0(3);
states(2).rhs = 'u0s*kg*exp(1-C/Cs)^g';

states(3).name = 'u2s';
states(3).dist = 'none';
states(3).data = y0(4);
states(3).rhs = '2*u1s*kg*exp(-Eg/T)*(1-C/Cs)^g';

states(4).name = 'u3s';
states(4).dist = 'none';
states(4).data = y0(5);
states(4).rhs = '3*u2s*kg*exp(-Eg/T)*(1-C/Cs)^g';

states(5).name = 'u0n';
states(5).dist = 'none';
states(5).data = y0(6);
states(5).rhs = 'u3s*kb*exp(-Eb/T)*(1-C/Cs)^b+u3n*kb*exp(-Eb/T)*(1-C/Cs)^b';

states(6).name = 'u1n';
states(6).dist = 'none';
states(6).data = y0(7);
states(6).rhs = 'u0n*kg*exp(-Eg/T)*(1-C/Cs)^g';

states(7).name = 'u2n';
states(7).dist = 'none';
states(7).data = y0(8);
states(7).rhs = '2*u1n*kg*exp(-Eg/T)*(1-C/Cs)^g';

states(8).name = 'u3n';
states(8).dist = 'none';
states(8).data = y0(9);
states(8).rhs = '3*u2n*kg*exp(-Eg/T)*(1-C/Cs)^g';


param(1).name = 'kb';
param(1).dist = 'normal';
param(1).data = [285,7.125];

param(2).name = 'kg';
param(2).dist = 'normal';
param(2).data = [1.44*10^8,0.036*10^8];

param(3).name = 'Eg';
param(3).dist = 'normal';
param(3).data = [4859,121.475];

param(4).name = 'Eb';
param(4).dist = 'normal';
param(4).data = [7517,187.925];

param(5).name = 'g';
param(5).dist = 'normal';
param(5).data = [1.5,0.0375];

param(6).name = 'b';
param(6).dist = 'normal';
param(6).data = [1.45,0.03625];

param(7).name = 'kv';
param(7).dist = 'none';
param(7).data = 0.54;

param(8).name = 'rho';
param(8).dist = 'none';
param(8).data = 2.66*10^-12;

param(9).name = 'u0s';
param(9).dist = 'none';
param(9).data = y0(1);

inputs(1).name = 'T';
inputs(1).rhs = '323';
%inputs(1).rhs = 'piecewise(t_vec,T_vec,t)';
%inputs(1).t_vec = [0:1:1799];
%inputs(1).T_vec = ones(1,1800).*323;

inputs(2).name = 'Cs';
inputs(2).rhs = '6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2 ';

inputs(3).name = 'Cm';
inputs(3).rhs = '7.76 * 10^-2 + 2.46*10^-3 * (T-273) - 8.1*10^-6 * (T-273)^2';

outputs(1).name = 'y1';
outputs(1).rhs = 'u3s';

outputs(2).name = 'y2';
outputs(2).rhs = 'u3n';

simoptions.tspan = [0 180];
simoptions.dt = 5; % in continuous-time this only defines the stepwidth for plotting
simoptions.setup = odeset;
simoptions.solver = 'ode45';

pce_order = 3;
col_samples = 15; % number of collocation points
n_samples = 100; % number of basis evaluation samples

sys = PCETcompose(states,param,inputs,outputs);
writeMCRHSfile(sys,'PCE3_ODE_1.m');
writeMCOUTfile(sys,'PCE3_OUT_1.m');

%PCETwriteFiles(sys,'PCE3_ODE.m','PCE3_OUT.m','PCE3_MCODE.m','PCE3_MCOUT.m');

basis_evals  = PCETsample(sys,'basis',n_samples);

col  = PCETsample(sys, 'basis',col_samples);
a = 1
PC  = PCETsimCollocation(sys ,'PCE3_ODE_1' ,'PCE3_OUT_1' ,col,simoptions,'method','final');




