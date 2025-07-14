function [O,ZWT,OF,OS,Psi_s_H,Psi_s_L,gsr_H,gsr_L,Exwat_H,Exwat_L,Rd,WTR,POT,OH,OL] = Soil_Water_MultiLayer(V,Zs, dz,n,Ccrown,Osat,Ohy,nVG,alpVG,lVG,Ks_Zs,L,Pe,O33,Ks_mac,Omac,alpVGM,nVGM,lVGM,s_SVG,bVG,Phy1,SPAR,EvL_Zs,Inf_Zs,RfH_Zs,RfL_Zs, Rrootl_H,Rrootl_L,PsiL50_H,PsiL50_L,PsiX50_H,PsiX50_L,Ts,Tdp,Psi_sto_00_H,Psi_sto_50_H,Psi_sto_00_L,Psi_sto_50_L, Salt,Osm_reg_Max_H,Osm_reg_Max_L,eps_root_base_H,eps_root_base_L)
% Wrapper for logging I/O to tc.Soil_Water_MultiLayer
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Soil_Water_MultiLayer', inputs);

    [O,ZWT,OF,OS,Psi_s_H,Psi_s_L,gsr_H,gsr_L,Exwat_H,Exwat_L,Rd,WTR,POT,OH,OL] = tc.Soil_Water_MultiLayer(V,Zs, dz,n,Ccrown,Osat,Ohy,nVG,alpVG,lVG,Ks_Zs,L,Pe,O33,Ks_mac,Omac,alpVGM,nVGM,lVGM,s_SVG,bVG,Phy1,SPAR,EvL_Zs,Inf_Zs,RfH_Zs,RfL_Zs, Rrootl_H,Rrootl_L,PsiL50_H,PsiL50_L,PsiX50_H,PsiX50_L,Ts,Tdp,Psi_sto_00_H,Psi_sto_50_H,Psi_sto_00_L,Psi_sto_50_L, Salt,Osm_reg_Max_H,Osm_reg_Max_L,eps_root_base_H,eps_root_base_L);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Soil_Water_MultiLayer', outputs);
end
