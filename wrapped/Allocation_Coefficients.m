function [fs1,fr1,fl1] = Allocation_Coefficients(TBio,LAI,Bfac,Se,Ts,FNC,aSE,age_cr,dflo,soCrop,OPT_VCA)
% Wrapper for logging I/O to tc.Allocation_Coefficients
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Allocation_Coefficients', inputs);

    [fs1,fr1,fl1] = tc.Allocation_Coefficients(TBio,LAI,Bfac,Se,Ts,FNC,aSE,age_cr,dflo,soCrop,OPT_VCA);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Allocation_Coefficients', outputs);
end
