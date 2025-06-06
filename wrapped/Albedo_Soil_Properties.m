function [soil_alb,e_gr] = Albedo_Soil_Properties(OS,Color_Class)
% Wrapper for logging I/O to tc.Albedo_Soil_Properties
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Albedo_Soil_Properties', inputs);

    [soil_alb,e_gr] = tc.Albedo_Soil_Properties(OS,Color_Class);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Albedo_Soil_Properties', outputs);
end
