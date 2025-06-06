function  T  = flow_matrix(E, R, d1, d2)
% Wrapper for logging I/O to tc.flow_matrix
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('flow_matrix', inputs);

     T  = tc.flow_matrix(E, R, d1, d2);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('flow_matrix', outputs);
end
