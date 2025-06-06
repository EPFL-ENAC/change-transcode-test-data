function  [R, S]  = dem_flow(E, d1, d2)
% Wrapper for logging I/O to tc.dem_flow
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('dem_flow', inputs);

     [R, S]  = tc.dem_flow(E, d1, d2);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('dem_flow', outputs);
end
