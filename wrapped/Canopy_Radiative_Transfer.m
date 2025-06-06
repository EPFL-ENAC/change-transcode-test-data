function [Iup,Idn,Kopt,om_vis_vg] = Canopy_Radiative_Transfer(PFT_opt,soil_alb,h_S,LAI,SAI,LAId,dw_SNO)
% Wrapper for logging I/O to tc.Canopy_Radiative_Transfer
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Canopy_Radiative_Transfer', inputs);

    [Iup,Idn,Kopt,om_vis_vg] = tc.Canopy_Radiative_Transfer(PFT_opt,soil_alb,h_S,LAI,SAI,LAId,dw_SNO);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Canopy_Radiative_Transfer', outputs);
end
