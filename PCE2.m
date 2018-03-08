
clc, clear variables, close all
addpath(genpath('../../../PCET'));
y = [0.1743 66.66 1.83*10^4 5.05*10^6 1.93*10^9 0.867 0 0 0]';

states(1).name = 'u0n';
states(1).dist = 'none';
states(1).data = y(5);
states(1).rhs = 'kb*exp(-Eb/T)*((C -(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))/(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))^b';

states(2).name = 'u1n';
states(2).dist = 'none';
states(2).data = y(6);
states(2).rhs = 'u0n*kg*exp(-Eg/T)*((C -(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))/(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))^g';

states(3).name = 'u2n';
states(3).dist = 'none';
states(3).data = y(8);
states(3).rhs = '2*u1n*kg*exp(-Eg/T)*((C -(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))/(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))^g';

states(4).name = 'u3n';
states(4).dist = 'none';
states(4).data = y(9);
states(4).rhs = '3*u2n*kg*exp(-Eg/T)*((C -(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))/(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))^g';

states(5).name = 'u2s';
states(5).dist = 'none';
states(5).data = y(4);
states(5).rhs = '2*u1s*kg*exp(-Eg/T)*((C -(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))/(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))^g';

states(6).name = 'u3s';
states(6).dist = 'none';
states(6).data = y(5);
states(6).rhs = '3*u2s*kg*exp(-Eg/T)*((C -(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))/(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))^g';

states(7).name = 'u1s';
states(7).dist = 'none';
states(7).data = y(3);
states(7).rhs = 'u0s*kg*exp(-Eg/T)*((C -(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))/(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))^g';

states(8).name = 'u0s';
states(8).dist = 'none';
states(8).data = y(2);
states(8).rhs = 0;

states(9).name = 'C';
states(9).dist = 'none';
states(9).data = y(1);
states(9).rhs = '-3*u2n*rho*kv*kg*exp(-Eg/T)*((C -(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))/(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))^g - 3*u2s*rho*kv*kb*exp(-Eg/T)*((C -(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))/(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))^g';

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

simoptions.tspan = [0 1800];
simoptions.dt = 1;
simoptions.setup = odeset;
simoptions.solver = 'ode15s';






inputs(1).name = 'T';
%inputs(1).rhs = '323';
inputs(1).rhs = 'piecewise(t_vec,T_vec,t)';
inputs(1).t_vec = [0:10:1790];
inputs(1).T_vec = ones(1,1791)*323;


outputs(1).name = 'a1';
outputs(1).rhs = 'u3n';


outputs(2).name = 'a2';
outputs(2).rhs = 'u3s';
pce_order = 3;

sys = PCETcompose(states,param,inputs,outputs);
PCETwriteFiles(sys,'PCE2_ODE.m','PCE2_OUT.m','PCE2_MCODE.m','PCE2_MCOUT.m')
