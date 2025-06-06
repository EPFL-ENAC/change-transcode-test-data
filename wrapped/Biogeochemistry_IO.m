function [B_IO] = Biogeochemistry_IO(Zs,Lat,Lon,Upl,HIST,FertN,FertP,FertK,ManF,N_Man,P_Man,K_Man,Lig_fr_Man,DepN,DepP,DepK)
% Wrapper for logging I/O to tc.Biogeochemistry_IO
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Biogeochemistry_IO', inputs);

    [B_IO] = tc.Biogeochemistry_IO(Zs,Lat,Lon,Upl,HIST,FertN,FertP,FertK,ManF,N_Man,P_Man,K_Man,Lig_fr_Man,DepN,DepP,DepK);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Biogeochemistry_IO', outputs);
end
