function [PLD] = Plant_Disconnection(Psi_x,Psi_l,Axyl,PsiL50,PsiL00,PsiX50)
% Wrapper for logging I/O to tc.Plant_Disconnection
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Plant_Disconnection', inputs);

    [PLD] = tc.Plant_Disconnection(Psi_x,Psi_l,Axyl,PsiL50,PsiL00,PsiX50);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Plant_Disconnection', outputs);
end
