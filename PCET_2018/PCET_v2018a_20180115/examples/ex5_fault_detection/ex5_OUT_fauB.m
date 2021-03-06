function fout = ex5_OUT_fauB(t,X_in,PAR,ut1,uv1,ut2,uv2)

 x1 = X_in(1,:);
 x2 = X_in(2,:);
 x3 = X_in(3,:);
 
 u1 = piecewise(ut1,uv1,t);
 u2 = piecewise(ut2,uv2,t);
 Qf = PAR.c2*pi*PAR.r^2*sqrt(2*PAR.g*x2);
 
 y = x3;

 fout = [y];
end