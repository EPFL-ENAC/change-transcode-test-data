function [B,LitFirEmi] = Litter_Fire(B,FireA)
% Wrapper for logging I/O to tc.Litter_Fire
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Litter_Fire', inputs);

    [B,LitFirEmi] = tc.Litter_Fire(B,FireA);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Litter_Fire', outputs);
end
