function [Lk] = Leakage_Rock(Krock,In,dth)
% Wrapper for logging I/O to tc.Leakage_Rock
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Leakage_Rock', inputs);

    [Lk] = tc.Leakage_Rock(Krock,In,dth);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Leakage_Rock', outputs);
end
