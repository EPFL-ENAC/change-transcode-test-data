function [Psi_x,Psi_l,Jsx,Jxl,Kleaf,Kx,Vx,Vl] = Plant_Hydraulic(Xout,X0,dth,Ccrown,T,Psi_s,hc,LAI,Axyl,PsiL50,PsiL00,Kleaf_max,Kx_max,PsiX50,Sl,mSl,Cx,Cl)
% Wrapper for logging I/O to tc.Plant_Hydraulic
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Plant_Hydraulic', inputs);

    [Psi_x,Psi_l,Jsx,Jxl,Kleaf,Kx,Vx,Vl] = tc.Plant_Hydraulic(Xout,X0,dth,Ccrown,T,Psi_s,hc,LAI,Axyl,PsiL50,PsiL00,Kleaf_max,Kx_max,PsiX50,Sl,mSl,Cx,Cl);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Plant_Hydraulic', outputs);
end
