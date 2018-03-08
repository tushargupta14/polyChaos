function fout = PCE3_MCOUT(t,X_in,PAR)

 C = X_in(1,:);
 u0s = X_in(2,:);
 u1s = X_in(3,:);
 u2s = X_in(4,:);
 u3s = X_in(5,:);
 u0n = X_in(6,:);
 u1n = X_in(7,:);
 u2n = X_in(8,:);
 u3n = X_in(9,:);
 
 T = 323;
 Cs = 6.29 * 10^-2 + 2.46*10^-3 * (T-273) - 7.14 * 10^-6 * (T-273)^2;
 Cm = 7.76 * 10^-2 + 2.46*10^-3 * (T-273) - 8.1*10^-6 * (T-273)^2;
 
 y1 = u3s;
 y2 = u3n;
 
 fout = [y1; y2];
end