function [lanS,cv_Soil,CTt] = Soil_Thermal_properties(Tdp,rsd,lan_dry,lan_s,cv_s,Osat,Ohy,O)
% Wrapper for logging I/O to tc.Soil_Thermal_properties
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Soil_Thermal_properties', inputs);

    [lanS,cv_Soil,CTt] = tc.Soil_Thermal_properties(Tdp,rsd,lan_dry,lan_s,cv_s,Osat,Ohy,O);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Soil_Thermal_properties', outputs);
end
