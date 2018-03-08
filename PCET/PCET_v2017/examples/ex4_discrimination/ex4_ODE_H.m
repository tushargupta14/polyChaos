function dXdt = ex4_ODE_H(t,X,PCETsystem,u1_t,u1_v)
 M = PCETsystem.coeff_matrices;

 x_1 = X(0*PCETsystem.pce.options.n_phi+1:1*PCETsystem.pce.options.n_phi);
 x_2 = X(1*PCETsystem.pce.options.n_phi+1:2*PCETsystem.pce.options.n_phi);
 
 u1 = piecewise(u1_t,u1_v,t);
 
 x_1x_2 = mykron(x_1,x_2);
 
 ddt_x_1 = M.p_1_O2*x_1x_2 - M.p_1_O1*x_1 + M.p_2_O1*x_2 + M.p_3_O2*x_1x_2 - M.p_3_O1*x_1 + u1*M.one_O1*x_2;
 ddt_x_2 = - M.p_1_O2*x_1x_2 + M.p_1_O1*x_1 - M.p_2_O1*x_2 - u1*M.one_O1*x_2;
 
 dXdt = [ddt_x_1; ddt_x_2];
end