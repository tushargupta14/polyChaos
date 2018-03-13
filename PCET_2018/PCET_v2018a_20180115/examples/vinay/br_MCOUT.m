function fout = br_MCOUT(t,X_in,PAR)

 Xs = X_in(1,:);
 Ss = X_in(2,:);
 Ps = X_in(3,:);
 hs = X_in(4,:);
 x1 = X_in(5,:);
 x2 = X_in(6,:);
 x3 = X_in(7,:);
 x4 = X_in(8,:);
 
 Fin = 0.15;
 Sf = 20;
 
 y1 = Ss;
 y2 = Ps;
 y3 = hs;
 
 fout = [y1; y2; y3];
end