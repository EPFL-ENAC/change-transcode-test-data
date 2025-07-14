function [BfixN] = Biogeo_Bio_fixation(AAET,LAI,B,REXMY,Tdp)
% Wrapper for logging I/O to tc.Biogeo_Bio_fixation
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Biogeo_Bio_fixation', inputs);

    [BfixN] = tc.Biogeo_Bio_fixation(AAET,LAI,B,REXMY,Tdp);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Biogeo_Bio_fixation', outputs);
end
