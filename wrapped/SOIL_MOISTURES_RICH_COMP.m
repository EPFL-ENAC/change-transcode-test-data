function [dV] = SOIL_MOISTURES_RICH_COMP(t,V, Lk,f,EG,T_H,T_L, Qi_in,Slo_pot,IS,SPAR,Osat,Ohy,O33,dz,Ks_Zs,Dz,numn,L,Pe,aR,aT,alpVG,nVG,lVG,Ks_mac,Omac,alpVGM,nVGM,lVGM,Phy1,s_SVG,bVG,Zs,cosalp,sinalp,SN)
% Wrapper for logging I/O to tc.SOIL_MOISTURES_RICH_COMP
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('SOIL_MOISTURES_RICH_COMP', inputs);

    [dV] = tc.SOIL_MOISTURES_RICH_COMP(t,V, Lk,f,EG,T_H,T_L, Qi_in,Slo_pot,IS,SPAR,Osat,Ohy,O33,dz,Ks_Zs,Dz,numn,L,Pe,aR,aT,alpVG,nVG,lVG,Ks_mac,Omac,alpVGM,nVGM,lVGM,Phy1,s_SVG,bVG,Zs,cosalp,sinalp,SN);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('SOIL_MOISTURES_RICH_COMP', outputs);
end
