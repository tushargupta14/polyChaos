%PCE'



y0 = [0.1743 66.66 1.83*10^4 5.05*10^6 1.93*10^9 0.867 0 0 0]';

%simoptions.tspan = [0 1800];
%simoptions.dt = 10 ;
%simoptions.setup = odeset;
%simoptions.solver = 'ode15s';

pce_order = 2;
col_samples = 30; % number of collocation points
% Parameters 

parameters(1).name = 'kb';
parameters(1).dist = 'normal';
parameters(1).data = [285,7.125];

parameters(2).name = 'kg';
parameters(2).dist = 'normal';
parameters(2).data = [1.44*10^8,0.036*10^8];

parameters(3).name = 'Eg';
parameters(3).dist = 'normal';
parameters(3).data = [4859,121.475];

parameters(4).name = 'Eb';
parameters(4).dist = 'normal';
parameters(4).data = [7517,187.925];

parameters(5).name = 'g';
parameters(5).dist = 'normal';
parameters(5).data = [1.5,0.0375];

parameters(6).name = 'b';
parameters(6).dist = 'normal';
parameters(6).data = [1.45,0.03625];

parameters(7).name = 'kv';
parameters(7).dist = 'none';
parameters(7).data = 0.54;

parameters(8).name = 'rho';
parameters(8).dist = 'none';
parameters(8).data = 2.66*10^-12;


% inputs 
inputs(1).name = 'T';
inputs(1).rhs = '323';
%inputs(1).rhs = 'piecewise(t_vec,T_vec,t)';
%inputs(1).t_vec = [0:10:1790];
%inputs(1).T_vec = ones(1,1791)*323;

%inputs(2).name = 'Cs';
%inputs(2).rhs = 'piecewise(t_vec,Cs_vec,t)';
%inputs(2).t_vec = [0:10:1790];
%inputs(2).Cs_vec = ones(1,1791)*(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2);

%inputs(3).name = 'Cm';
%inputs(3).rhs = 'piecewise(t_vec,Cm_vec,t)';
%inputs(2).t_vec = [0:10:1790];
%inputs(3).Cm_vec = ones(1,1791)*(7.76 * 10^-2 + 2.46*10^-3 * (T-273) - 8.1*10^-6 * (T-273)^2);

%States
states(1).name = 'C';
states(1).dist = 'none';
states(1).data = y0(1);
states(1).rhs = '-3*u2n*rho*kv*kg*exp(-Eg/T)*((C -(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))/(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))^g - 3*u2s*rho*kv*kb*exp(-Eg/T)*((C -(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))/(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))^g';

states(2).name = 'u0s';
states(2).dist = 'none';
states(2).data = y0(2);
states(2).rhs = '0';

states(3).name = 'u1s';
states(3).dist = 'none';
states(3).data = y0(3);
states(3).rhs = 'u0s*kg*exp(-Eg/T)*((C -(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))/(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))^g';

states(4).name = 'u2s';
states(4).dist = 'none';
states(4).data = y0(4);
states(4).rhs = '2*u1s*kg*exp(-Eg/T)*((C -(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))/(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))^g';

%states(5).name = 'u3s';
%states(5).dist = 'none';
%states(5).data = y0(5);
%states(5).rhs = '3*u2s*kg*exp(-Eg/T)*((C -(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))/(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))^g';

%states(6).name = 'u0n';
%states(6).dist = 'none';
%states(6).data = y0(6);
%states(6).rhs = 'kb*exp(-Eb/T)*((C -(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))/(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))^b';

%states(7).name = 'u1n';
%states(7).dist = 'none';
%states(7).data = y0(7);
%states(7).rhs = 'u0n*kg*exp(-Eg/T)*((C -(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))/(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))^g';

%states(8).name = 'u2n';
%states(8).dist = 'none';
%states(8).data = y0(8);
%states(8).rhs = '2*u1n*kg*exp(-Eg/T)*((C -(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))/(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))^g';

%states(9).name = 'u3n';
%states(9).dist = 'none';
%states(9).data = y0(9);
%states(9).rhs = '3*u2n*kg*exp(-Eg/T)*((C -(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))/(6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2)))^g';


% outputs

outputs(1).name = 'y1';
outputs(1).rhs = 'u3s';

outputs(2).name = 'y2';
outputs(2).rhs = 'u3n';

a = 1
sys = PCETcompose(states,parameters,inputs,pce_order);


