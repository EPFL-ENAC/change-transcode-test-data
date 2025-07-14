function [GF] = EnvConGrowth(Ta,Bfac,gcoef)
% Wrapper for logging I/O to tc.EnvConGrowth
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'EnvConGrowth', inputs);

    [GF] = tc.EnvConGrowth(Ta,Bfac,gcoef);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'EnvConGrowth', outputs);
end
