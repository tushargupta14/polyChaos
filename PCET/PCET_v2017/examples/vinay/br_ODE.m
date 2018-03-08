function dXdt = br_ODE(t,X,PCETsys)
 M = PCETsys.coeff_matrices;

 Xs = X(0*PCETsys.pce.options.n_phi+1:1*PCETsys.pce.options.n_phi);
 Ss = X(1*PCETsys.pce.options.n_phi+1:2*PCETsys.pce.options.n_phi);
 Ps = X(2*PCETsys.pce.options.n_phi+1:3*PCETsys.pce.options.n_phi);
 hs = X(3*PCETsys.pce.options.n_phi+1:4*PCETsys.pce.options.n_phi);
 x1 = X(4*PCETsys.pce.options.n_phi+1:5*PCETsys.pce.options.n_phi);
 x2 = X(5*PCETsys.pce.options.n_phi+1:6*PCETsys.pce.options.n_phi);
 x3 = X(6*PCETsys.pce.options.n_phi+1:7*PCETsys.pce.options.n_phi);
 x4 = X(7*PCETsys.pce.options.n_phi+1:8*PCETsys.pce.options.n_phi);
 
 Fin = 0.15;
 Sf = 20;
 
 Psx1 = mykron(Ps,x1);
 SsSsx1x2x2 = mykron(Ss,mykron(Ss,mykron(x1,mykron(x2,x2))));
 Ssx1 = mykron(Ss,x1);
 Ssx1x2x2 = mykron(Ss,mykron(x1,mykron(x2,x2)));
 XsSsPsx2 = mykron(Xs,mykron(Ss,mykron(Ps,x2)));
 XsSsPsx2x2x2 = mykron(Xs,mykron(Ss,mykron(Ps,mykron(x2,mykron(x2,x2)))));
 XsSsSsPsx2x2x2 = mykron(Xs,mykron(Ss,mykron(Ss,mykron(Ps,mykron(x2,mykron(x2,x2))))));
 XsSsSsx2x2x2 = mykron(Xs,mykron(Ss,mykron(Ss,mykron(x2,mykron(x2,x2)))));
 XsSsx2 = mykron(Xs,mykron(Ss,x2));
 XsSsx2x2x2 = mykron(Xs,mykron(Ss,mykron(x2,mykron(x2,x2))));
 Xsx1 = mykron(Xs,x1);
 x1x1 = mykron(x1,x1);
 x1x1x3 = mykron(x1,mykron(x1,x3));
 x1x2x2 = mykron(x1,mykron(x2,x2));
 x3x4 = mykron(x3,x4);
 x3x4x4x4 = mykron(x3,mykron(x4,mykron(x4,x4)));
 x4x4x4 = mykron(x4,mykron(x4,x4));
 
 ddt_Xs = - Fin*M.r2pi1_O2*Xsx1 - M.mum0KiPm_O4*XsSsPsx2 + M.mum0Ki_O3*XsSsx2;
 ddt_Ss = Fin*Sf*M.r2pi1_O1*x1 - Fin*M.r2pi1_O2*Ssx1 + M.mum0KiPmyxs_O4*XsSsPsx2 - M.mum0Kiyxs_O3*XsSsx2;
 ddt_Ps = - Fin*M.one_O2*Psx1 - M.mum0KiPma_O4*XsSsPsx2 + M.mum0Kia_O3*XsSsx2 + M.b_O1*Xs;
 ddt_hs = Fin*M.r2pi1_O0 - M.r2k1pi1_O1*x3;
 ddt_x1 = - Fin*M.r2pi1_O2*x1x1 + M.r2k1pi1_O3*x1x1x3;
 ddt_x2 = - Fin*Sf*M.Kir2pi1_O3*x1x2x2 + Fin*M.Kir2pi1_O4*Ssx1x2x2 -2*Fin*Sf*M.r2pi1_O4*Ssx1x2x2 + 2*Fin*M.r2pi1_O5*SsSsx1x2x2 - M.mum0KiKiPmyxs_O6*XsSsPsx2x2x2 + M.mum0KiKiyxs_O5*XsSsx2x2x2 -2*M.mum0KiPmyxs_O7*XsSsSsPsx2x2x2 + 2*M.mum0Kiyxs_O6*XsSsSsx2x2x2;
 ddt_x3 = 0.5*Fin*M.r2pi1_O1*x4 -0.5*M.r2k1pi1_O2*x3x4;
 ddt_x4 = -0.5*Fin*M.r2pi1_O3*x4x4x4 + 0.5*M.r2k1pi1_O4*x3x4x4x4;
 
 dXdt = [ddt_Xs; ddt_Ss; ddt_Ps; ddt_hs; ddt_x1; ddt_x2; ddt_x3; ddt_x4];
end