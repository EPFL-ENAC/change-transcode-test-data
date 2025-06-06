function [Mpar] = Vegetation_Management_Parameter()
% Wrapper for logging I/O to tc.Vegetation_Management_Parameter
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Vegetation_Management_Parameter', inputs);

    [Mpar] = tc.Vegetation_Management_Parameter();
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Vegetation_Management_Parameter', outputs);
end
