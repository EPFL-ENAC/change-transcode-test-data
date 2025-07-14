%FUNCTION_SIGNATURE%
% Wrapper for logging I/O to %ORIGINAL_FUNC%
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, '%FUNC_NAME%', inputs);

    %FUNC_CALL%;
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, '%FUNC_NAME%', outputs);
end
