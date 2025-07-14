function  [r, s]  = facet_flow(e0, e1, e2, d1, d2)
% Wrapper for logging I/O to tc.facet_flow
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'facet_flow', inputs);

     [r, s]  = tc.facet_flow(e0, e1, e2, d1, d2);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'facet_flow', outputs);
end
