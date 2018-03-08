function fout = br_OUT(t,X,PCETsys)
 M = PCETsys.coeff_matrices;

 Xs = X(0*PCETsys.pce.options.n_phi+1:1*PCETsys.pce.options.n_phi);
 Ss = X(1*PCETsys.pce.options.n_phi+1:2*PCETsys.pce.options.n_phi);
 Ps = X(2*PCETsys.pce.options.n_phi+1:3*PCETsys.pce.options.n_phi);
 hs = X(3*PCETsys.pce.options.n_phi+1:4*PCETsys.pce.options.n_phi);
 x1 = X(4*PCETsys.pce.options.n_phi+1:5*PCETsys.pce.options.n_phi);
 x2 = X(5*PCETsys.pce.options.n_phi+1:6*PCETsys.pce.options.n_phi);
 x3 = X(6*PCETsys.pce.options.n_phi+1:7*PCETsys.pce.options.n_phi);
 x4 = X(7*PCETsys.pce.options.n_phi+1:8*PCETsys.pce.options.n_phi);
 
 Fin = 0.15;
 Sf = 20;
 
 
 y1 = M.one_O1*Ss;
 y2 = M.one_O1*Ps;
 y3 = M.one_O1*hs;
 
 fout = [y1; y2; y3];
end