function  [ShF]  = Shadow_Effect(DTM,h_S,zeta_S,HZ,Z)
% Wrapper for logging I/O to tc.Shadow_Effect
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Shadow_Effect', inputs);

     [ShF]  = tc.Shadow_Effect(DTM,h_S,zeta_S,HZ,Z);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Shadow_Effect', outputs);
end
