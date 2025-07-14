function [Se_bio,Se_fc,Psi_bio,Tdp_bio,Vtot,VT] = Biogeo_environment(Tdp,O,V,Soil_Param,Phy,SPAR,Bio_Zs)
% Wrapper for logging I/O to tc.Biogeo_environment
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Biogeo_environment', inputs);

    [Se_bio,Se_fc,Psi_bio,Tdp_bio,Vtot,VT] = tc.Biogeo_environment(Tdp,O,V,Soil_Param,Phy,SPAR,Bio_Zs);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Biogeo_environment', outputs);
end
