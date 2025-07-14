function [Lk] = Leakage_Bottom(O,Ks_Zs,Osat,Ohy,L,alpVG,nVG,lVG,Ks_mac,Omac,alpVGM,nVGM,lVGM,Kbot,ms,SPAR)
% Wrapper for logging I/O to tc.Leakage_Bottom
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Leakage_Bottom', inputs);

    [Lk] = tc.Leakage_Bottom(O,Ks_Zs,Osat,Ohy,L,alpVG,nVG,lVG,Ks_mac,Omac,alpVGM,nVGM,lVGM,Kbot,ms,SPAR);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Leakage_Bottom', outputs);
end
