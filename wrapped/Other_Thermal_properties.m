function [lan,cv,CT] = Other_Thermal_properties(Cwat,Curb,Crock,ms)
% Wrapper for logging I/O to tc.Other_Thermal_properties
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Other_Thermal_properties', inputs);

    [lan,cv,CT] = tc.Other_Thermal_properties(Cwat,Curb,Crock,ms);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Other_Thermal_properties', outputs);
end
