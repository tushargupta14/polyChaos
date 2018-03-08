function fout = PCE3_OUT(t,X,PCETsys)
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
 
 
 y1 = M.one_O1*u3s;
 y2 = M.one_O1*u3n;
 
 fout = [y1; y2];
end