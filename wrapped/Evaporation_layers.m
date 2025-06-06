function [EvL_Zs] = Evaporation_layers(Zs,Zdes)
% Wrapper for logging I/O to tc.Evaporation_layers
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Evaporation_layers', inputs);

    [EvL_Zs] = tc.Evaporation_layers(Zs,Zdes);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Evaporation_layers', outputs);
end
