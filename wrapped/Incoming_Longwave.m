function [Latm,N] = Incoming_Longwave(Ta,ea,N)
% Wrapper for logging I/O to tc.Incoming_Longwave
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Incoming_Longwave', inputs);

    [Latm,N] = tc.Incoming_Longwave(Ta,ea,N);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Incoming_Longwave', outputs);
end
