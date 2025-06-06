function   Check_Land_Cover_Fractions(Crock,Curb,Cwat,Cbare,Ccrown)
% Wrapper for logging I/O to tc.Check_Land_Cover_Fractions
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Check_Land_Cover_Fractions', inputs);

      tc.Check_Land_Cover_Fractions(Crock,Curb,Cwat,Cbare,Ccrown);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Check_Land_Cover_Fractions', outputs);
end
