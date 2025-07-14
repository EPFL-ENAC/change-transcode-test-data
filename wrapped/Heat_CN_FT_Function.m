function  [T]  = Heat_CN_FT_Function(Ttm1,dts,Pre,rsd,lan_dry,lan_s,cv_s,SPAR,L,Pe,O33,alpVG,nVG, Phy1,s_SVG,bVG,Osat,Ohy,Oicetm1,Otm1,Zs,G0,Gn,Tup,Tdown,AE,OPZ,OPT_FR_SOIL)
% Wrapper for logging I/O to tc.Heat_CN_FT_Function
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Heat_CN_FT_Function', inputs);

     [T]  = tc.Heat_CN_FT_Function(Ttm1,dts,Pre,rsd,lan_dry,lan_s,cv_s,SPAR,L,Pe,O33,alpVG,nVG, Phy1,s_SVG,bVG,Osat,Ohy,Oicetm1,Otm1,Zs,G0,Gn,Tup,Tdown,AE,OPZ,OPT_FR_SOIL);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Heat_CN_FT_Function', outputs);
end
