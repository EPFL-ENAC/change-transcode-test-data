function  [R, S]  = pixel_flow(E, i, j, d1, d2)
% Wrapper for logging I/O to tc.pixel_flow
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'pixel_flow', inputs);

     [R, S]  = tc.pixel_flow(E, i, j, d1, d2);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'pixel_flow', outputs);
end
