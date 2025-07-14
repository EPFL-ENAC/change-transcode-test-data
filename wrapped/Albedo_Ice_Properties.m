function [sur_alb,e_sur] = Albedo_Ice_Properties(alb_ice)
% Wrapper for logging I/O to tc.Albedo_Ice_Properties
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Albedo_Ice_Properties', inputs);

    [sur_alb,e_sur] = tc.Albedo_Ice_Properties(alb_ice);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Albedo_Ice_Properties', outputs);
end
