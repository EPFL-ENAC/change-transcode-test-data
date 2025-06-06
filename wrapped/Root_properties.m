function [Rl] = Root_properties(BR,rroot)
% Wrapper for logging I/O to tc.Root_properties
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Root_properties', inputs);

    [Rl] = tc.Root_properties(BR,rroot);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Root_properties', outputs);
end
