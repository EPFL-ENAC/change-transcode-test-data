function  [dX] = PLANT_HYDRAULIC_DIFF_NEW(t,X,Ccrown,Psi_s,T,hc,LAI,Axyl,PsiL50,PsiL00,Kleaf_max,Cl,Sl,Kx_max,PsiX50,Cx,gsr,dt,V_avail)
% Wrapper for logging I/O to tc.PLANT_HYDRAULIC_DIFF_NEW
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('PLANT_HYDRAULIC_DIFF_NEW', inputs);

     [dX] = tc.PLANT_HYDRAULIC_DIFF_NEW(t,X,Ccrown,Psi_s,T,hc,LAI,Axyl,PsiL50,PsiL00,Kleaf_max,Cl,Sl,Kx_max,PsiX50,Cx,gsr,dt,V_avail);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('PLANT_HYDRAULIC_DIFF_NEW', outputs);
end
