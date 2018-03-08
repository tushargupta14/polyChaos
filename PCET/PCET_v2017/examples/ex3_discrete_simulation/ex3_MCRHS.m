function dXdt = ex3_MCRHS(t,X,PAR,vars)

 A = X(1);
 B = X(2);
 
 
 ddt_A = PAR.p_1*A;
 ddt_B = PAR.p_2*A*B + PAR.R;

 dXdt = [ddt_A; ddt_B];
end