function [lanS,cv_Soil,CTt,Oice,O,Cw] = Soil_Thermal_properties_FT(Tdp,Pre,rsd,lan_dry,lan_s,cv_s,SPAR,L,Pe,O33,alpVG,nVG, Phy1,s_SVG,bVG,Osat,Ohy,Otot,OPT_FR_SOIL)
% Wrapper for logging I/O to tc.Soil_Thermal_properties_FT
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Soil_Thermal_properties_FT', inputs);

    [lanS,cv_Soil,CTt,Oice,O,Cw] = tc.Soil_Thermal_properties_FT(Tdp,Pre,rsd,lan_dry,lan_s,cv_s,SPAR,L,Pe,O33,alpVG,nVG, Phy1,s_SVG,bVG,Osat,Ohy,Otot,OPT_FR_SOIL);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Soil_Thermal_properties_FT', outputs);
end
