function [r_soil,b_soil,alp_soil] = Soil_Resistence(Ts,Pre,Ws,ea,q_runon,O,Ks,Osat,Ohy,L,Pe,O33,alpVG,nVG,lVG,Ks_mac,Omac,alpVGM,nVGM,lVGM,Phy,s_SVG,bVG,SPAR)
% Wrapper for logging I/O to tc.Soil_Resistence
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Soil_Resistence', inputs);

    [r_soil,b_soil,alp_soil] = tc.Soil_Resistence(Ts,Pre,Ws,ea,q_runon,O,Ks,Osat,Ohy,L,Pe,O33,alpVG,nVG,lVG,Ks_mac,Omac,alpVGM,nVGM,lVGM,Phy,s_SVG,bVG,SPAR);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Soil_Resistence', outputs);
end
