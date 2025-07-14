function  [hc]  = GrassHeight(LAI,LAIdead)
% Wrapper for logging I/O to tc.GrassHeight
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'GrassHeight', inputs);

     [hc]  = tc.GrassHeight(LAI,LAIdead);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'GrassHeight', outputs);
end
