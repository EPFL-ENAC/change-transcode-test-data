function [BfixN] = Biogeo_Bio_fixation(AAET,LAI,B,REXMY,Tdp)
% Wrapper for logging I/O to tc.Biogeo_Bio_fixation
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Biogeo_Bio_fixation', inputs);

    [BfixN] = tc.Biogeo_Bio_fixation(AAET,LAI,B,REXMY,Tdp);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Biogeo_Bio_fixation', outputs);
end
