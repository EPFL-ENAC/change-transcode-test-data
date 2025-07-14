function [NH4_Uptake,NO3_Uptake,P_Uptake,K_Uptake] = Biogeo_uptake(B,Broot,Ts,T,VT,Ccrown,EM,BiogeoPar)
% Wrapper for logging I/O to tc.Biogeo_uptake
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Biogeo_uptake', inputs);

    [NH4_Uptake,NO3_Uptake,P_Uptake,K_Uptake] = tc.Biogeo_uptake(B,Broot,Ts,T,VT,Ccrown,EM,BiogeoPar);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Biogeo_uptake', outputs);
end
