function [jDay] = JULIAN_DAY(D)
% Wrapper for logging I/O to tc.JULIAN_DAY
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('JULIAN_DAY', inputs);

    [jDay] = tc.JULIAN_DAY(D);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('JULIAN_DAY', outputs);
end
