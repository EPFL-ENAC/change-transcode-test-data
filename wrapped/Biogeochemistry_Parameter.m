function [BiogeoPar] = Biogeochemistry_Parameter(opt_cons_CUE)
% Wrapper for logging I/O to tc.Biogeochemistry_Parameter
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Biogeochemistry_Parameter', inputs);

    [BiogeoPar] = tc.Biogeochemistry_Parameter(opt_cons_CUE);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Biogeochemistry_Parameter', outputs);
end
