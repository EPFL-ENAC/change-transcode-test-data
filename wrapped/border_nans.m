function  mask  = border_nans(E)
% Wrapper for logging I/O to tc.border_nans
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('border_nans', inputs);

     mask  = tc.border_nans(E);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('border_nans', outputs);
end
