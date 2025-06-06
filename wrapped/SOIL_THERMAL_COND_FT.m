function [dT] = SOIL_THERMAL_COND_FT(t,T,Pre,rsd,lan_dry,lan_s,cv_s,SPAR,L,Pe,O33,alpVG,nVG, Phy1,s_SVG,bVG,Osat,Ohy,Oicetm1,Otm1,dz,nz,Dz,G0,Gn,Tup,Tdown,AE,OPZ,OPT_FR_SOIL)
% Wrapper for logging I/O to tc.SOIL_THERMAL_COND_FT
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('SOIL_THERMAL_COND_FT', inputs);

    [dT] = tc.SOIL_THERMAL_COND_FT(t,T,Pre,rsd,lan_dry,lan_s,cv_s,SPAR,L,Pe,O33,alpVG,nVG, Phy1,s_SVG,bVG,Osat,Ohy,Oicetm1,Otm1,dz,nz,Dz,G0,Gn,Tup,Tdown,AE,OPZ,OPT_FR_SOIL);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('SOIL_THERMAL_COND_FT', outputs);
end
