function dXdt = br_MCODE(t,X,PAR)

 Xs = X(1);
 Ss = X(2);
 Ps = X(3);
 hs = X(4);
 x1 = X(5);
 x2 = X(6);
 x3 = X(7);
 x4 = X(8);
 
 Fin = 0.15;
 Sf = 20;
 
 ddt_Xs = -Fin*Xs*x1*PAR.pi1*PAR.r2 + PAR.mum0*PAR.Ki*Ss*Xs*x2 - PAR.mum0*PAR.Ki*Ps*Ss*Xs*x2*PAR.Pm;
 ddt_Ss = Fin*Sf*x1*PAR.pi1*PAR.r2 - Fin*Ss*x1*PAR.pi1*PAR.r2 - PAR.mum0*PAR.Ki*Ss*Xs*x2*PAR.yxs + PAR.mum0*PAR.Ki*Ps*Ss*Xs*x2*PAR.Pm*PAR.yxs;
 ddt_Ps = -Fin*Ps*x1 + PAR.a*PAR.Ki*PAR.mum0*Ss*Xs*x2 - PAR.a*PAR.Ki*PAR.mum0*Ps*Ss*Xs*x2*PAR.Pm + PAR.b*Xs;
 ddt_hs = Fin*PAR.pi1*PAR.r2 - PAR.k1*x3*PAR.pi1*PAR.r2;
 ddt_x1 = -x1*x1*Fin*PAR.pi1*PAR.r2 + PAR.k1*x1*x1*x3*PAR.pi1*PAR.r2;
 ddt_x2 = -x2*x2*2*Ss*PAR.pi1*PAR.r2*Fin*Sf*x1 - x2*x2*PAR.Ki*PAR.pi1*PAR.r2*Fin*Sf*x1 + x2*x2*2*Ss*PAR.pi1*PAR.r2*Fin*Ss*x1 + x2*x2*PAR.Ki*PAR.pi1*PAR.r2*Fin*Ss*x1 + x2*x2*2*Ss*PAR.mum0*PAR.Ki*Ss*Xs*x2*PAR.yxs + x2*x2*PAR.Ki*PAR.mum0*PAR.Ki*Ss*Xs*x2*PAR.yxs - x2*x2*2*Ss*PAR.mum0*PAR.Ki*Ps*Ss*Xs*x2*PAR.Pm*PAR.yxs -  x2*x2*PAR.Ki*PAR.mum0*PAR.Ki*Ps*Ss*Xs*x2*PAR.Pm*PAR.yxs;
 ddt_x3 = Fin*x4*0.5*PAR.pi1*PAR.r2 - PAR.k1*x4*x3*0.5*PAR.pi1*PAR.r2;
 ddt_x4 = -x4*x4*x4*Fin*0.5*PAR.pi1*PAR.r2 + x4*x4*x4*PAR.k1*x3*0.5*PAR.pi1*PAR.r2;

 dXdt = [ddt_Xs; ddt_Ss; ddt_Ps; ddt_hs; ddt_x1; ddt_x2; ddt_x3; ddt_x4];
end