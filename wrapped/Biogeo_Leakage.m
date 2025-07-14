function [LEAK_NH4,LEAK_NO3,LEAK_P,LEAK_K,LEAK_DOC,LEAK_DON,LEAK_DOP] = Biogeo_Leakage(B,Lk,V,BiogeoPar)
% Wrapper for logging I/O to tc.Biogeo_Leakage
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Biogeo_Leakage', inputs);

    [LEAK_NH4,LEAK_NO3,LEAK_P,LEAK_K,LEAK_DOC,LEAK_DON,LEAK_DOP] = tc.Biogeo_Leakage(B,Lk,V,BiogeoPar);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Biogeo_Leakage', outputs);
end
