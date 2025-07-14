function [lan,cv,CT] = Other_Thermal_properties(Cwat,Curb,Crock,ms)
% Wrapper for logging I/O to tc.Other_Thermal_properties
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Other_Thermal_properties', inputs);

    [lan,cv,CT] = tc.Other_Thermal_properties(Cwat,Curb,Crock,ms);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Other_Thermal_properties', outputs);
end
