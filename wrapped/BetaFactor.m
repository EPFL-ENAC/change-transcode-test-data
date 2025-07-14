function [Bfac,Bfac_all] = BetaFactor(Psi_l,PsiL00,PsiL50,PsiG50,PsiG99)
% Wrapper for logging I/O to tc.BetaFactor
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'BetaFactor', inputs);

    [Bfac,Bfac_all] = tc.BetaFactor(Psi_l,PsiL00,PsiL50,PsiG50,PsiG99);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'BetaFactor', outputs);
end
