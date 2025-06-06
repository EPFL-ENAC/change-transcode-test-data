function [f,fpot] = Infiltration_2(Osat,Ohy,L,alpVG,nVG,lVG,Pe,Ks_Zs,O33,Ks_mac,Omac,alpVGM,nVGM,lVGM,Phy,s_SVG,bVG,SPAR,O,Dz,WIS,cosalp,Pond)
% Wrapper for logging I/O to tc.Infiltration_2
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Infiltration_2', inputs);

    [f,fpot] = tc.Infiltration_2(Osat,Ohy,L,alpVG,nVG,lVG,Pe,Ks_Zs,O33,Ks_mac,Omac,alpVGM,nVGM,lVGM,Phy,s_SVG,bVG,SPAR,O,Dz,WIS,cosalp,Pond);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Infiltration_2', outputs);
end
