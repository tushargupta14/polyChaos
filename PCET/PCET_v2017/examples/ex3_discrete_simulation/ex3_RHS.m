function dXdt = ex3_RHS(t,X,PCETsystem,vars)
 M = PCETsystem.coeff_matrices;

 A = X(0*PCETsystem.pce.options.n_phi+1:1*PCETsystem.pce.options.n_phi);
 B = X(1*PCETsystem.pce.options.n_phi+1:2*PCETsystem.pce.options.n_phi);
 
 
 AB = mykron(A,B);
 
 ddt_A = M.p_1_O1*A;
 ddt_B = M.p_2_O2*AB + M.R_O0;
 
 dXdt = [ddt_A; ddt_B];
end