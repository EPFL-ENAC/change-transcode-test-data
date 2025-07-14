function   Biogeo_Spin_Up()
% Wrapper for logging I/O to tc.Biogeo_Spin_Up
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Biogeo_Spin_Up', inputs);

      tc.Biogeo_Spin_Up();
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Biogeo_Spin_Up', outputs);
end
