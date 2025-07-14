function [Ko,Po] = Conductivity_Suction(SPAR,Ks,Osat,Ohy,L,Pe,O33,alpVG,nVG,lVG,Ks_mac,Omac,alpVGM,nVGM,lVGM,Phy1,s_SVG,bVG,O)
% Wrapper for logging I/O to tc.Conductivity_Suction
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Conductivity_Suction', inputs);

    [Ko,Po] = tc.Conductivity_Suction(SPAR,Ks,Osat,Ohy,L,Pe,O33,alpVG,nVG,lVG,Ks_mac,Omac,alpVGM,nVGM,lVGM,Phy1,s_SVG,bVG,O);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Conductivity_Suction', outputs);
end
