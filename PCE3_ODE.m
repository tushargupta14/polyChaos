function dXdt = PCE3_ODE(t,X,PCETsys)
 M = PCETsys.coeff_matrices;

 C = X(0*PCETsys.pce.options.n_phi+1:1*PCETsys.pce.options.n_phi);
 u0s = X(1*PCETsys.pce.options.n_phi+1:2*PCETsys.pce.options.n_phi);
 u1s = X(2*PCETsys.pce.options.n_phi+1:3*PCETsys.pce.options.n_phi);
 u2s = X(3*PCETsys.pce.options.n_phi+1:4*PCETsys.pce.options.n_phi);
 u3s = X(4*PCETsys.pce.options.n_phi+1:5*PCETsys.pce.options.n_phi);
 u0n = X(5*PCETsys.pce.options.n_phi+1:6*PCETsys.pce.options.n_phi);
 u1n = X(6*PCETsys.pce.options.n_phi+1:7*PCETsys.pce.options.n_phi);
 u2n = X(7*PCETsys.pce.options.n_phi+1:8*PCETsys.pce.options.n_phi);
 u3n = X(8*PCETsys.pce.options.n_phi+1:9*PCETsys.pce.options.n_phi);
 
 T = 323;
 Cs = 6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2;
 Cm = 7.76 * 10^-2 + 2.46*10^-3 * (T-273) - 8.1*10^-6 * (T-273)^2;
 
 
 ddt_C = *M.one_O0;
 ddt_u0s = *M.one_O0;
 ddt_u1s = *M.one_O0;
 ddt_u2s = *M.one_O0;
 ddt_u3s = *M.one_O0;
 ddt_u0n = *M.one_O0;
 ddt_u1n = *M.one_O0;
 ddt_u2n = *M.one_O0;
 ddt_u3n = *M.one_O0;
 
 dXdt = [ddt_C; ddt_u0s; ddt_u1s; ddt_u2s; ddt_u3s; ddt_u0n; ddt_u1n; ddt_u2n; ddt_u3n];
end