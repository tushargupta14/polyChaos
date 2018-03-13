function dXdt = ex1_ODE(t,X,PCETsys,ut,uv)
 M = PCETsys.coeff_matrices;

 x = X(0*PCETsys.pce.options.n_phi+1:1*PCETsys.pce.options.n_phi);
 
 u = piecewise(ut,uv,t);
 
 xx = mykron(x,x);
 
 ddt_x = - M.aa_O2*xx + u*M.b_O0;
 
 dXdt = [ddt_x];
end