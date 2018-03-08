function dXdt = ex4_MCODE_M(t,X,PAR,u1_t,u1_v)

 x_1 = X(1);
 x_2 = X(2);
 
 u1 = piecewise(u1_t,u1_v,t);
 
 ddt_x_1 = PAR.p_1*(x_2-1)*x_1+(PAR.p_2+u1)*x_2;
 ddt_x_2 = PAR.p_1*(1-x_2)*x_1-(PAR.p_3+PAR.p_2+u1)*x_2;

 dXdt = [ddt_x_1; ddt_x_2];
end