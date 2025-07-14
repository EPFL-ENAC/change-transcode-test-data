function [ParEx] = Exudation_Parameter(bfix)
% Wrapper for logging I/O to tc.Exudation_Parameter
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Exudation_Parameter', inputs);

    [ParEx] = tc.Exudation_Parameter(bfix);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Exudation_Parameter', outputs);
end
