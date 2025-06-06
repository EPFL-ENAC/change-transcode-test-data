function [Stoich] = Veg_Stoichiometric_Parameter(Nl)
% Wrapper for logging I/O to tc.Veg_Stoichiometric_Parameter
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Veg_Stoichiometric_Parameter', inputs);

    [Stoich] = tc.Veg_Stoichiometric_Parameter(Nl);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Veg_Stoichiometric_Parameter', outputs);
end
