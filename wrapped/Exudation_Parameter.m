function [ParEx] = Exudation_Parameter(bfix)
% Wrapper for logging I/O to tc.Exudation_Parameter
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Exudation_Parameter', inputs);

    [ParEx] = tc.Exudation_Parameter(bfix);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Exudation_Parameter', outputs);
end
