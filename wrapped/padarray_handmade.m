function  [Enl_Row] = padarray_handmade(M,srow,scol)
% Wrapper for logging I/O to tc.padarray_handmade
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('padarray_handmade', inputs);

     [Enl_Row] = tc.padarray_handmade(M,srow,scol);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('padarray_handmade', outputs);
end
