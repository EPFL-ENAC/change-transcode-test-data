function [PFT_opt] = Veg_Optical_Parameter(PFT_Class)
% Wrapper for logging I/O to tc.Veg_Optical_Parameter
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Veg_Optical_Parameter', inputs);

    [PFT_opt] = tc.Veg_Optical_Parameter(PFT_Class);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Veg_Optical_Parameter', outputs);
end
