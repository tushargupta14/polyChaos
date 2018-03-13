function fout = ex1_OUT(t,X,PCETsys,ut,uv)
 M = PCETsys.coeff_matrices;

 x = X(0*PCETsys.pce.options.n_phi+1:1*PCETsys.pce.options.n_phi);
 
 u = piecewise(ut,uv,t);
 
 xx = mykron(x,x);
 
 y = 3*M.one_O2*xx;
 
 fout = [y];
end