function gendata()

    load("workspaceBegin.mat");


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %              SetSunVariables                  %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    save("data/input/SetSunVariables1.mat",  "Datam", "DeltaGMT", "Lon", "Lat", "t_bef", "t_aft");
    [h_S,delta_S,zeta_S,T_sunrise,T_sunset,L_day] = SetSunVariables(Datam,DeltaGMT,Lon,Lat,t_bef,t_aft)
    save("data/output/SetSunVariables1.mat", "h_S", "delta_S", "zeta_S", "T_sunrise", "T_sunset", "L_day");

    
    Datam(2) = 2;
    Lon = -1;

    save("data/input/SetSunVariables2.mat",  "Datam", "DeltaGMT", "Lon", "Lat", "t_bef", "t_aft");
    [h_S,delta_S,zeta_S,T_sunrise,T_sunset,L_day] = SetSunVariables(Datam,DeltaGMT,Lon,Lat,t_bef,t_aft)
    save("data/output/SetSunVariables2.mat", "h_S", "delta_S", "zeta_S", "T_sunrise", "T_sunset", "L_day");

    Datam(2) = 3;
    Datam(1) = 2000;

    save("data/input/SetSunVariables3.mat",  "Datam", "DeltaGMT", "Lon", "Lat", "t_bef", "t_aft");
    [h_S,delta_S,zeta_S,T_sunrise,T_sunset,L_day] = SetSunVariables(Datam,DeltaGMT,Lon,Lat,t_bef,t_aft)
    save("data/output/SetSunVariables3.mat", "h_S", "delta_S", "zeta_S", "T_sunrise", "T_sunset", "L_day");

    Datam(1) = 2004;

    save("data/input/SetSunVariables4.mat",  "Datam", "DeltaGMT", "Lon", "Lat", "t_bef", "t_aft");
    [h_S,delta_S,zeta_S,T_sunrise,T_sunset,L_day] = SetSunVariables(Datam,DeltaGMT,Lon,Lat,t_bef,t_aft)
    save("data/output/SetSunVariables4.mat", "h_S", "delta_S", "zeta_S", "T_sunrise", "T_sunset", "L_day");
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %              soil_Water_Multilayer            %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % [infos]
    % ms = n
    SPAR = 1;

    save("data/input/Soil_Water_Multilayer1.mat","Vtm1", "Zs", "dz", "ms", "Ccrown", "Osat", "Ohy", "nVG", "alpVG", "lVG", "Ks_Zs", "L", "Pe", "O33", "Ks_mac", "Omac", "alpVGM", "nVGM", "lVGM", "s_SVG", "bVG", "Phy", "SPAR", "EvL_Zs", "Inf_Zs", "RfH_Zs", "RfL_Zs", "Rrootl_H", "Rrootl_L", "PsiL50_H", "PsiL50_L", "PsiX50_H", "PsiX50_L", "Tstm1", "Tdptm1", "Psi_sto_00_H", "Psi_sto_50_H", "Psi_sto_00_L", "Psi_sto_50_L", "Salt", "Osm_reg_Max_H", "Osm_reg_Max_L", "eps_root_base_H", "eps_root_base_L")
    [Otm1,ZWTtm1,OFtm1,OStm1,Psi_stm1_H,Psi_stm1_L,gsr_Htm1,gsr_Ltm1,Exwat_Htm1,Exwat_Ltm1]=Soil_Water_MultiLayer(Vtm1,Zs,...
    dz,ms,Ccrown,Osat,Ohy,nVG,alpVG,lVG,Ks_Zs,L,Pe,O33,Ks_mac,Omac,alpVGM,nVGM,lVGM,s_SVG,bVG,Phy,SPAR,EvL_Zs,Inf_Zs,RfH_Zs,RfL_Zs,...
    Rrootl_H,Rrootl_L,PsiL50_H,PsiL50_L,PsiX50_H,PsiX50_L,Tstm1,Tdptm1,Psi_sto_00_H,Psi_sto_50_H,Psi_sto_00_L,Psi_sto_50_L,...
    Salt,Osm_reg_Max_H,Osm_reg_Max_L,eps_root_base_H,eps_root_base_L);
    save("data/output/Soil_water_Multilayer1.mat", "Otm1", "ZWTtm1", "OFtm1", "OStm1", "Psi_stm1_H", "Psi_stm1_L", "gsr_Htm1", "gsr_Ltm1", "Exwat_Htm1", "Exwat_Ltm1")

    %{
    SPAR = 1;
    Salt = 1;
    SPAR = 3;
    ms = 2;

    Vtm1 = Vtm1(1:ms)
    Zs = Zs(1:ms + 1)
    dz = dz(1:ms)
    Osat = Osat(1:ms)
    Ohy = Ohy(1:ms)
    nVG = nVG(1:ms)
    alpVG = alpVG(1:ms)
    lVG = lVG(1:ms)
    Ks_Zs = Ks_Zs(1:ms)
    L = L(1:ms)
    Pe = Pe(1:ms)
    O33 = O33(1:ms)
    Ks_mac = Ks_mac(1:ms)
    Omac = Omac(1:ms)
    alpVGM = alpVGM(1:ms)
    nVGM = nVGM(1:ms)
    lVGM = lVGM(1:ms)
    s_SVG = s_SVG(1:ms)
    bVG = bVG(1:ms)
    EvL_Zs = EvL_Zs(1:ms)
    Inf_Zs = Inf_Zs(1:ms)
    RfH_Zs = RfH_Zs(1:ms)
    RfL_Zs = RfL_Zs(1:ms)
    Tdptm1 = Tdptm1(1:ms)
    
    Osat = (1/2) * ones(1, ms);
    Ohy = ones(1, ms);

    save("data/input/Soil_Water_Multilayer2.mat","Vtm1", "Zs", "dz", "ms", "Ccrown", "Osat", "Ohy", "nVG", "alpVG", "lVG", "Ks_Zs", "L", "Pe", "O33", "Ks_mac", "Omac", "alpVGM", "nVGM", "lVGM", "s_SVG", "bVG", "Phy", "SPAR", "EvL_Zs", "Inf_Zs", "RfH_Zs", "RfL_Zs", "Rrootl_H", "Rrootl_L", "PsiL50_H", "PsiL50_L", "PsiX50_H", "PsiX50_L", "Tstm1", "Tdptm1", "Psi_sto_00_H", "Psi_sto_50_H", "Psi_sto_00_L", "Psi_sto_50_L", "Salt", "Osm_reg_Max_H", "Osm_reg_Max_L", "eps_root_base_H", "eps_root_base_L")
    [Otm1,ZWTtm1,OFtm1,OStm1,Psi_stm1_H,Psi_stm1_L,gsr_Htm1,gsr_Ltm1,Exwat_Htm1,Exwat_Ltm1]=Soil_Water_MultiLayer(Vtm1,Zs,...
    dz,ms,Ccrown,Osat,Ohy,nVG,alpVG,lVG,Ks_Zs,L,Pe,O33,Ks_mac,Omac,alpVGM,nVGM,lVGM,s_SVG,bVG,Phy,SPAR,EvL_Zs,Inf_Zs,RfH_Zs,RfL_Zs,...
    Rrootl_H,Rrootl_L,PsiL50_H,PsiL50_L,PsiX50_H,PsiX50_L,Tstm1,Tdptm1,Psi_sto_00_H,Psi_sto_50_H,Psi_sto_00_L,Psi_sto_50_L,...
    Salt,Osm_reg_Max_H,Osm_reg_Max_L,eps_root_base_H,eps_root_base_L);
    save("data/output/Soil_water_Multilayer2.mat", "Otm1", "ZWTtm1", "OFtm1", "OStm1", "Psi_stm1_H", "Psi_stm1_L", "gsr_Htm1", "gsr_Ltm1", "Exwat_Htm1", "Exwat_Ltm1")

    Ohy(1) = 0
    Osat(1) = 99
    SPAR = 2;

    save("data/input/Soil_Water_Multilayer3.mat","Vtm1", "Zs", "dz", "ms", "Ccrown", "Osat", "Ohy", "nVG", "alpVG", "lVG", "Ks_Zs", "L", "Pe", "O33", "Ks_mac", "Omac", "alpVGM", "nVGM", "lVGM", "s_SVG", "bVG", "Phy", "SPAR", "EvL_Zs", "Inf_Zs", "RfH_Zs", "RfL_Zs", "Rrootl_H", "Rrootl_L", "PsiL50_H", "PsiL50_L", "PsiX50_H", "PsiX50_L", "Tstm1", "Tdptm1", "Psi_sto_00_H", "Psi_sto_50_H", "Psi_sto_00_L", "Psi_sto_50_L", "Salt", "Osm_reg_Max_H", "Osm_reg_Max_L", "eps_root_base_H", "eps_root_base_L")
    [Otm1,ZWTtm1,OFtm1,OStm1,Psi_stm1_H,Psi_stm1_L,gsr_Htm1,gsr_Ltm1,Exwat_Htm1,Exwat_Ltm1]=Soil_Water_MultiLayer(Vtm1,Zs,...
    dz,ms,Ccrown,Osat,Ohy,nVG,alpVG,lVG,Ks_Zs,L,Pe,O33,Ks_mac,Omac,alpVGM,nVGM,lVGM,s_SVG,bVG,Phy,SPAR,EvL_Zs,Inf_Zs,RfH_Zs,RfL_Zs,...
    Rrootl_H,Rrootl_L,PsiL50_H,PsiL50_L,PsiX50_H,PsiX50_L,Tstm1,Tdptm1,Psi_sto_00_H,Psi_sto_50_H,Psi_sto_00_L,Psi_sto_50_L,...
    Salt,Osm_reg_Max_H,Osm_reg_Max_L,eps_root_base_H,eps_root_base_L);
    save("data/output/Soil_water_Multilayer3.mat", "Otm1", "ZWTtm1", "OFtm1", "OStm1", "Psi_stm1_H", "Psi_stm1_L", "gsr_Htm1", "gsr_Ltm1", "Exwat_Htm1", "Exwat_Ltm1")

    SPAR = 4;
    Vtm1(1) = -5
    Vtm1(2) = -2

    save("data/input/Soil_Water_Multilayer4.mat","Vtm1", "Zs", "dz", "ms", "Ccrown", "Osat", "Ohy", "nVG", "alpVG", "lVG", "Ks_Zs", "L", "Pe", "O33", "Ks_mac", "Omac", "alpVGM", "nVGM", "lVGM", "s_SVG", "bVG", "Phy", "SPAR", "EvL_Zs", "Inf_Zs", "RfH_Zs", "RfL_Zs", "Rrootl_H", "Rrootl_L", "PsiL50_H", "PsiL50_L", "PsiX50_H", "PsiX50_L", "Tstm1", "Tdptm1", "Psi_sto_00_H", "Psi_sto_50_H", "Psi_sto_00_L", "Psi_sto_50_L", "Salt", "Osm_reg_Max_H", "Osm_reg_Max_L", "eps_root_base_H", "eps_root_base_L")
    [Otm1,ZWTtm1,OFtm1,OStm1,Psi_stm1_H,Psi_stm1_L,gsr_Htm1,gsr_Ltm1,Exwat_Htm1,Exwat_Ltm1]=Soil_Water_MultiLayer(Vtm1,Zs,...
    dz,ms,Ccrown,Osat,Ohy,nVG,alpVG,lVG,Ks_Zs,L,Pe,O33,Ks_mac,Omac,alpVGM,nVGM,lVGM,s_SVG,bVG,Phy,SPAR,EvL_Zs,Inf_Zs,RfH_Zs,RfL_Zs,...
    Rrootl_H,Rrootl_L,PsiL50_H,PsiL50_L,PsiX50_H,PsiX50_L,Tstm1,Tdptm1,Psi_sto_00_H,Psi_sto_50_H,Psi_sto_00_L,Psi_sto_50_L,...
    Salt,Osm_reg_Max_H,Osm_reg_Max_L,eps_root_base_H,eps_root_base_L);
    save("data/output/Soil_water_Multilayer4.mat", "Otm1", "ZWTtm1", "OFtm1", "OStm1", "Psi_stm1_H", "Psi_stm1_L", "gsr_Htm1", "gsr_Ltm1", "Exwat_Htm1", "Exwat_Ltm1")
    %}

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %          Soil_Thermal_Properties_FT           %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    load("workspaceBegin.mat");

    SPAR = 1;
    disp(Otm1);
    disp(Oicetm1);
    
    test = Oicetm1
    test(1) = Otm1(1)
    test(2) = Otm1(2)

    save("data\input\Soil_Thermal_properties_FT1.mat",'Tdptm1','Pre','rsd','lan_dry','lan_s','cv_s','SPAR','L','Pe','O33','alpVG','nVG','Phy','s_SVG','bVG','Osat','Ohy','Otm1', 'Oicetm1','OPT_FR_SOIL')
    [lanS,cv_Soil,CTt,Oice,O,Cw]=Soil_Thermal_properties_FT(Tdptm1,Pre,rsd,lan_dry,lan_s,cv_s,SPAR,L,Pe,O33,alpVG,nVG,...
    Phy,s_SVG,bVG,Osat,Ohy,test ,OPT_FR_SOIL);
    save("data\output\Soil_Thermal_properties_FT1.mat",'CTt', "lanS", "cv_Soil", "Oice", "Cw", "O")

    %{
    SPAR = 2;

    %need to pass througn b, d, g, i and l
    save("data\input\Soil_Thermal_properties_FT2.mat",'Tdptm1','Pre','rsd','lan_dry','lan_s','cv_s','SPAR','L','Pe','O33','alpVG','nVG','Phy','s_SVG','bVG','Osat','Ohy','Otm1', 'Oicetm1','OPT_FR_SOIL')
    [out1, out2,CTt]=Soil_Thermal_properties_FT(Tdptm1,Pre,rsd,lan_dry,lan_s,cv_s,SPAR,L,Pe,O33,alpVG,nVG,...
    Phy,s_SVG,bVG,Osat,Ohy,(Otm1+Oicetm1),OPT_FR_SOIL);
    save("data\output\Soil_Thermal_properties_FT2.mat",'CTt', "out1", "out2")

    SPAR = 3;

    save("data\input\Soil_Thermal_properties_FT3.mat",'Tdptm1','Pre','rsd','lan_dry','lan_s','cv_s','SPAR','L','Pe','O33','alpVG','nVG','Phy','s_SVG','bVG','Osat','Ohy','Otm1', 'Oicetm1','OPT_FR_SOIL')
    [out1, out2,CTt]=Soil_Thermal_properties_FT(Tdptm1,Pre,rsd,lan_dry,lan_s,cv_s,SPAR,L,Pe,O33,alpVG,nVG,...
    Phy,s_SVG,bVG,Osat,Ohy,(Otm1+Oicetm1),OPT_FR_SOIL);
    save("data\output\Soil_Thermal_properties_FT3.mat",'CTt', "out1", "out2")

    SPAR = 5;

    save("data\input\Soil_Thermal_properties_FT4.mat",'Tdptm1','Pre','rsd','lan_dry','lan_s','cv_s','SPAR','L','Pe','O33','alpVG','nVG','Phy','s_SVG','bVG','Osat','Ohy','Otm1', 'Oicetm1','OPT_FR_SOIL')
    [out1, out2,CTt]=Soil_Thermal_properties_FT(Tdptm1,Pre,rsd,lan_dry,lan_s,cv_s,SPAR,L,Pe,O33,alpVG,nVG,...
    Phy,s_SVG,bVG,Osat,Ohy,(Otm1+Oicetm1),OPT_FR_SOIL);
    save("data\output\Soil_Thermal_properties_FT4.mat",'CTt', "out1", "out2")

    %}

    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %               soil resistance                 %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



    save("data\input\Soil_Resistence.mat", ...
    'Tdptm1', 'Pre', 'Ws_undertm1', 'ea', 'q_runon', 'OStm1', 'Ks_Zs', ...
    'Osat', 'Ohy', 'L', 'Pe', 'O33', 'alpVG', 'nVG', 'lVG', ...
    'Ks_mac', 'Omac', 'alpVGM', 'nVGM', 'lVGM', 'Phy', 's_SVG', 'bVG', 'SPAR');

    [r_soil, b_soil, alp_soil] = Soil_Resistence( ...
    Tdptm1(1), Pre, Ws_undertm1, ea, q_runon, OStm1, Ks_Zs(1), Osat(1), Ohy(1), ...
    L(1), Pe(1), O33(1), alpVG(1), nVG(1), lVG(1), Ks_mac(1), Omac(1), ...
    alpVGM(1), nVGM(1), lVGM(1), Phy, s_SVG(1), bVG(1), SPAR);

    save("data\output\Soil_Resistence.mat", 'r_soil', 'b_soil', 'alp_soil');



    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %             Aerodynamic_Resistance            %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Ts = 36;
    disp_h = 13;
    zom = 44;
    zoh = 56;
    
    save("data\input\Aerodynamic_Resistence.mat", "Ta", "Ts", "Pre", "zatm", "disp_h", "zom", "zoh", "Ws", "ea");
    [ra]=Aerodynamic_Resistence(Ta,Ts,Pre,zatm,disp_h,zom,zoh,Ws,ea);
    save("data\output\Aerodynamic_Resistence.mat", "ra");

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %             Abledo Ice Propreties             %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    alb_ice = 0.5;
    save("data\input\Albedo_Ice_propreties.mat", "alb_ice");
    [sur_alb, e_sur] = Albedo_Ice_Properties(alb_ice);
    save("data\output\Albedo_Ice_propreties.mat", "sur_alb", "e_sur");


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %             Abledo Other Propreties           %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    h_s = pi;
    Ccover = 'Curb';
    save("data\input\Albedo_other_properties1.mat", "Ccover", "h_s", "Urb_Par");
    [sur_alb, e_sur] = Albedo_OS_Properties(Ccover, h_s, Urb_Par)
    save("data\output\Albedo_other_properties1.mat", "sur_alb", "e_sur");


    Ccover = 'Crock';
    save("data\input\Albedo_other_properties2.mat", "Ccover", "h_s", "Urb_Par");
    [sur_alb, e_sur] = Albedo_OS_Properties(Ccover, h_s, Urb_Par)
    save("data\output\Albedo_other_properties2.mat", "sur_alb", "e_sur");

    Ccover = 'Cdeb';
    save("data\input\Albedo_other_properties3.mat", "Ccover", "h_s", "Urb_Par");
    [sur_alb, e_sur] = Albedo_OS_Properties(Ccover, h_s, Urb_Par)
    save("data\output\Albedo_other_properties3.mat", "sur_alb", "e_sur");

    Ccover = 'Cwat';
    save("data\input\Albedo_other_properties4.mat", "Ccover", "h_s", "Urb_Par");
    [sur_alb, e_sur] = Albedo_OS_Properties(Ccover, h_s, Urb_Par)
    save("data\output\Albedo_other_properties4.mat", "sur_alb", "e_sur");


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %             Abledo Soil Propreties            %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    OS = 0.65;
    color_class = 7;

    save("data\input\Albedo_soil_properties.mat", "OS", "color_class");
    [soil_alb, e_gr] = Albedo_Soil_Properties(OS, color_class);
    save("data\output\Albedo_soil_properties.mat", "soil_alb", "e_gr");
    
end