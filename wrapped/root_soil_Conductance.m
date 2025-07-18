function [Ksr] = root_soil_Conductance(Ks,Rl,rroot,dz)
% Wrapper for logging I/O to tc.root_soil_Conductance
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'root_soil_Conductance', inputs);

    [Ksr] = tc.root_soil_Conductance(Ks,Rl,rroot,dz);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'root_soil_Conductance', outputs);
end
