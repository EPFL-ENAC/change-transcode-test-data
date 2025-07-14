function [sur_alb,e_sur] = Albedo_OS_Properties(Ccover,h_S,Par)
% Wrapper for logging I/O to tc.Albedo_OS_Properties
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Albedo_OS_Properties', inputs);

    [sur_alb,e_sur] = tc.Albedo_OS_Properties(Ccover,h_S,Par);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Albedo_OS_Properties', outputs);
end
