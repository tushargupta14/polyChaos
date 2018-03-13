clear variables;
close all; clc

addpath(genpath('../../../PCET'));

pce_order = 3;

y0 = [7.0383 2.404 24.8687 1 1 0.0118 1 1]';
%Uncertain parameters
param(1).name = 'mum0';
param(1).dist = 'beta4';
param(1).data =  [2 3 0.44 0.52];

%Constant parameters
param(2).name = 'Ki';
param(2).dist = 'none';
param(2).data = 22;

param(3).name = 'Pm';
param(3).dist = 'none';
param(3).data = 1/50;

param(4).name = 'a';
param(4).dist = 'none';
param(4).data = 2.2;

param(5).name = 'b';
param(5).dist = 'none';
param(5).data = 0.2;

param(6).name = 'yxs';
param(6).dist = 'none';
param(6).data = 1/0.88;

param(7).name = 'r2';
param(7).dist = 'none';
param(7).data = (1/0.5)^2;

param(8).name = 'k1';
param(8).dist = 'none';
param(8).data = 0.15;

param(9).name = 'pi1';
param(9).dist = 'none';
param(9).data = 1/pi;

% param(3).name = 'Km';
% param(3).dist = 'none';
% param(3).data = 1.2;

%Inputs
inputs(1).name = 'Fin';
inputs(1).rhs  = '0.15';

inputs(2).name = 'Sf';
inputs(2).rhs = '20';

%States
states(1).name = 'Xs';
states(1).dist = 'none';
states(1).data = y0(1); 
states(1).rhs  = '-Fin*Xs*x1*pi1*r2 + mum0*Ki*Ss*Xs*x2 - mum0*Ki*Ps*Ss*Xs*x2*Pm';

states(2).name = 'Ss';
states(2).dist = 'none';
states(2).data = y0(2); 
states(2).rhs  = 'Fin*Sf*x1*pi1*r2 - Fin*Ss*x1*pi1*r2 - mum0*Ki*Ss*Xs*x2*yxs + mum0*Ki*Ps*Ss*Xs*x2*Pm*yxs';

states(3).name = 'Ps';
states(3).dist = 'none';
states(3).data = y0(3);
states(3).rhs = '-Fin*Ps*x1 + a*Ki*mum0*Ss*Xs*x2 - a*Ki*mum0*Ps*Ss*Xs*x2*Pm + b*Xs';

states(4).name = 'hs';
states(4).dist = 'none';
states(4).data = y0(4); 
states(4).rhs  = 'Fin*pi1*r2 - k1*x3*pi1*r2';

states(5).name = 'x1';
states(5).dist = 'none';
states(5).data = y0(5);
states(5).rhs = '-x1*x1*Fin*pi1*r2 + k1*x1*x1*x3*pi1*r2';

states(6).name = 'x2';
states(6).dist = 'none';
states(6).data = y0(6);
states(6).rhs = '-x2*x2*2*Ss*pi1*r2*Fin*Sf*x1 - x2*x2*Ki*pi1*r2*Fin*Sf*x1 + x2*x2*2*Ss*pi1*r2*Fin*Ss*x1 + x2*x2*Ki*pi1*r2*Fin*Ss*x1 + x2*x2*2*Ss*mum0*Ki*Ss*Xs*x2*yxs + x2*x2*Ki*mum0*Ki*Ss*Xs*x2*yxs - x2*x2*2*Ss*mum0*Ki*Ps*Ss*Xs*x2*Pm*yxs -  x2*x2*Ki*mum0*Ki*Ps*Ss*Xs*x2*Pm*yxs'; 

states(7).name = 'x3';
states(7).dist = 'none';
states(7).data = y0(7);
states(7).rhs  = 'Fin*x4*0.5*pi1*r2 - k1*x4*x3*0.5*pi1*r2';

states(8).name = 'x4';
states(8).dist = 'none';
states(8).data = y0(8);
states(8).rhs  = '-x4*x4*x4*Fin*0.5*pi1*r2 + x4*x4*x4*k1*x3*0.5*pi1*r2';

outputs(1).name = 'y1';
outputs(1).rhs  = '1*Ss';

outputs(2).name = 'y2';
outputs(2).rhs  = '1*Ps';

outputs(3).name = 'y3';
outputs(3).rhs  = '1*hs';


sys = PCETcompose(states,param,inputs,outputs,pce_order);
PCETwriteFiles(sys,'br_ODE.m','br_OUT.m','br_MCODE.m','br_MCOUT.m')

