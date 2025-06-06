function [G0,T,O,Oice] = Soil_Heat_Profile_New(Tup,dt,Ttm1,ms,dz,Zs,Pre,rsd,lan_dry,lan_s,cv_s,SPAR,L,Pe,O33,alpVG,nVG, Phy,s_SVG,bVG,Osat,Ohy,Oicetm1,Otm1,G0,OPT_FR_SOIL,OPT_ST)
% Wrapper for logging I/O to tc.Soil_Heat_Profile_New
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Soil_Heat_Profile_New', inputs);

    [G0,T,O,Oice] = tc.Soil_Heat_Profile_New(Tup,dt,Ttm1,ms,dz,Zs,Pre,rsd,lan_dry,lan_s,cv_s,SPAR,L,Pe,O33,alpVG,nVG, Phy,s_SVG,bVG,Osat,Ohy,Oicetm1,Otm1,G0,OPT_FR_SOIL,OPT_ST);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Soil_Heat_Profile_New', outputs);
end
