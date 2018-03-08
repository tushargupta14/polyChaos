function dXdt = PCE3_ODE_1(t,X,PAR)

 C = X(1);
 u1s = X(2);
 u2s = X(3);
 u3s = X(4);
 u0n = X(5);
 u1n = X(6);
 u2n = X(7);
 u3n = X(8);
 
 T = 323;
 Cs = 6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2;
 Cm = 7.76 * 10^-2 + 2.46*10^-3 * (T-273) - 8.1*10^-6 * (T-273)^2;
 
 ddt_C = -3*u2n*PAR.rho*PAR.kv*PAR.kg*exp(-PAR.Eg/T)*(1-C/Cs)^PAR.g - 3*u2s*PAR.rho*PAR.kv*PAR.kb*exp(-PAR.Eg/T)*(1-C/Cs)^PAR.g;
 ddt_u1s = PAR.u0s*PAR.kg*exp(1-C/Cs)^PAR.g;
 ddt_u2s = 2*u1s*PAR.kg*exp(-PAR.Eg/T)*(1-C/Cs)^PAR.g;
 ddt_u3s = 3*u2s*PAR.kg*exp(-PAR.Eg/T)*(1-C/Cs)^PAR.g;
 ddt_u0n = u3s*PAR.kb*exp(-PAR.Eb/T)*(1-C/Cs)^PAR.b+u3n*PAR.kb*exp(-PAR.Eb/T)*(1-C/Cs)^PAR.b;
 ddt_u1n = u0n*PAR.kg*exp(-PAR.Eg/T)*(1-C/Cs)^PAR.g;
 ddt_u2n = 2*u1n*PAR.kg*exp(-PAR.Eg/T)*(1-C/Cs)^PAR.g;
 ddt_u3n = 3*u2n*PAR.kg*exp(-PAR.Eg/T)*(1-C/Cs)^PAR.g;

 dXdt = [ddt_C; ddt_u1s; ddt_u2s; ddt_u3s; ddt_u0n; ddt_u1n; ddt_u2n; ddt_u3n];
end