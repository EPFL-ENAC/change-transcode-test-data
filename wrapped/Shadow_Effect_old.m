function  [ShF]  = Shadow_Effect_old(DTM,h_S,zeta_S,HZ,Z)
% Wrapper for logging I/O to tc.Shadow_Effect_old
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Shadow_Effect_old', inputs);

     [ShF]  = tc.Shadow_Effect_old(DTM,h_S,zeta_S,HZ,Z);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Shadow_Effect_old', outputs);
end
