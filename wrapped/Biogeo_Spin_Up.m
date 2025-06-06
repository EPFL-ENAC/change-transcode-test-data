function   Biogeo_Spin_Up()
% Wrapper for logging I/O to tc.Biogeo_Spin_Up
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Biogeo_Spin_Up', inputs);

      tc.Biogeo_Spin_Up();
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Biogeo_Spin_Up', outputs);
end
