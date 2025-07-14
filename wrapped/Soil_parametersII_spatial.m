function [Ofc,Oss,Owp,Ohy] = Soil_parametersII_spatial(Osat,L,Pe,Ks,O33,Kfc,Pss,Pwp,Phy)
% Wrapper for logging I/O to tc.Soil_parametersII_spatial
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Soil_parametersII_spatial', inputs);

    [Ofc,Oss,Owp,Ohy] = tc.Soil_parametersII_spatial(Osat,L,Pe,Ks,O33,Kfc,Pss,Pwp,Phy);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Soil_parametersII_spatial', outputs);
end
