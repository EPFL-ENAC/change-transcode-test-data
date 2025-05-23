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
    save("data/output/Soil_Water_Multilayer1.mat", "Otm1", "ZWTtm1", "OFtm1", "OStm1", "Psi_stm1_H", "Psi_stm1_L", "gsr_Htm1", "gsr_Ltm1", "Exwat_Htm1", "Exwat_Ltm1")

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

    
    test = Otm1+Oicetm1

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

    SPAR = 1;

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
    disp_h = 1;
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



    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %          Canopy Radiative transfer            %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    dw_SNO = 0.5;

    save("data\input\canopy_radiative_transfer.mat", "PFT_opt_L", "soil_alb", "h_S", "LAI_L", "SAI_L", "LAIdead_H", "dw_SNO")
    [Iup,Idn,Kopt,om_vis_vg]=Canopy_Radiative_Transfer(PFT_opt_L, soil_alb, h_S, LAI_L, SAI_L, LAIdead_H, dw_SNO);
    save("data\output\canopy_radiative_transfer.mat", "Iup", "Idn", "om_vis_vg", "Kopt")

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %                CO2 concentration              %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

    Cc = 340.5;
    IPAR = 0;
    Csl = 340.5;
    rb = 30.2;
    Psi_L = PsiL00_L;
    Psi_sto_50 = Psi_sto_50_L;
    Psi_sto_99 = -0.5;
    CT = CT_L;
    Vmax = Vmax_L;
    DS = 0.7;
    Ha = Ha_L;
    FI = FI_L;
    Do = Do_L;
    a1 = a1_L;
    go = go_L;
    gmes = gmes_L;
    rjv = rjv_L;
    ra = 75.3;


    save("data\input\CO2_concentration.mat", "Cc", "IPAR", "Csl", "ra", "rb", "Ts", "Pre", "Ds", "Psi_L", "Psi_sto_50", "Psi_sto_99", "CT", "Vmax", "DS", "Ha", "FI", "Oa", "Do", "a1", "go", "gmes", "rjv");

    [DCi]=CO2_Concentration(Cc,IPAR,Csl,ra,rb,Ts,Pre,Ds,...
     Psi_L,Psi_sto_50,Psi_sto_99,CT,Vmax,DS,Ha,FI,Oa,Do,a1,go,gmes,rjv);

    save("data\output\CO2_concentration.mat", "DCi");


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %           Photosynthesis biochemical          %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

    [CcF,An,rs,Rdark,F755nm,GAM,gsCO2] = photosynthesis_biochemical(Cc,IPAR,Csl,ra,rb,Ts,Pre,Ds,...
     Psi_L,Psi_sto_50,Psi_sto_99,...
    CT,Vmax,DS,Ha,FI,Oa,Do,a1,go,gmes,rjv)

    save("data\output\photosynthesis_biochemical.mat", "CcF", "An", "rs", "Rdark", "F755nm", "GAM", "gsCO2");


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %              Conductivity Suction             %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Ks = 12.7398;

    save("data\input\conductivity_suction.mat", ...
    "SPAR", "Ks", "Osat", "Ohy", "L", "Pe", "O33", "alpVG", "nVG", "lVG", ...
    "Ks_mac", "Omac", "alpVGM", "nVGM", "lVGM", "Phy", "s_SVG", "bVG", "O");

    [Ko, Po] = Conductivity_Suction( ...
    SPAR, Ks, Osat, Ohy, L, Pe, O33, alpVG, nVG, lVG, ...
    Ks_mac, Omac, alpVGM, nVGM, lVGM, Phy, s_SVG, bVG, O);

    save("data\output\conductivity_suction.mat", "Ko", "Po")


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %              incomming longwaves              %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    save("data\input\incomming_longwave.mat", "Ta", "ea", "N");

    [Latm, Nres] = Incoming_Longwave(Ta, ea, N);

    save("data\output\incomming_longwave.mat", "Latm", "Nres");

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %             Abledo Snow Propreties            %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    SWE = 0.5;
    Cdeb = 0;
    Cice = 1;
    Pr_sno = 0.5;
    Pr_liq = -1;
    ros = 0;



    save("data\input\Albedo_snow_properties.mat", "dt", "SWE", "h_S", "Ts", "Ta",...
        "SWEtm1", "tau_snotm1", "snow_albtm1", "Th_Pr_sno", "Pr_sno_day", "Aice",...
        "Deb_Par", "Cdeb", "Cice", "Ta_day", "Pr_sno", "Pr_liq", "ros", "N");

    [snow_alb,tau_sno,e_sno]=Albedo_Snow_Properties(dt,SWE,h_S,Ts,Ta,SWEtm1,tau_snotm1,snow_albtm1,...
        Th_Pr_sno,Pr_sno_day,Aice,Deb_Par,Cdeb,Cice,Ta_day,Pr_sno,Pr_liq,ros,N);

    save("data\output\Albedo_snow_properties.mat", "snow_alb", "tau_sno", "e_sno");



    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %                 Volume Correction             %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    EG = 0.576
    Lk = 1.2
    T_H = [0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5];
    T_L = [0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5];

    save("data\input\volume_correction.mat", "Vtm1", "EvL_Zs", "RfH_Zs", "RfL_Zs", "EG", "T_H", "T_L", "Lk")

    [V2,T_H2,T_L2,EG2,Lk2]=Volume_Correction(Vtm1,EvL_Zs,RfH_Zs,RfL_Zs,EG,T_H,T_L,Lk)

    save("data\output\volume_correction.mat", "Lk2", "EG2", "T_L2", "T_H2", "V2")


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %            undercanopy leaf resistance        %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    zom_under = 33;
    SND = 0;
    disp_h_H = 13;
    disp_h_L = 10;
    zom_H =73;
    zom_L = 44;
    zatm = 50;

    save('data\input\undercanopy_leaf_resistance.mat', ...
    'Ws', 'Ta', 'Ts', 'Ccrown', 'hc_H', 'hc_L', 'LAI_H', 'LAI_L', ...
    'd_leaf_H', 'd_leaf_L', 'zatm', 'disp_h', 'zom', 'zom_under', ...
    'SND', 'disp_h_H', 'zom_H', 'disp_h_L', 'zom_L');

    [rap_H, rap_L, rb_H, rb_L, Ws_und] = Undercanopy_Leaf_Resistence2(Ws, Ta, Ts, Ccrown, hc_H, hc_L, LAI_H, LAI_L, d_leaf_H, d_leaf_L,...
        zatm, disp_h, zom, zom_under, SND, disp_h_H, zom_H, disp_h_L, zom_L);
    

    save('data\output\undercanopy_leaf_resistance.mat','rap_L', 'rap_H', 'rb_H', 'rb_L', 'Ws_und');



    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %                   Throughfall                 %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Llitter = 2.45;
    Kc = 1;

    save("data\input\throughfall.mat", "LAI_H", "SAI_H", "LAI_L", "SAI_L", "Llitter", "Kc");


    [Cfol_H,Cfol_L,CLitter]=Throughfall(LAI_H,SAI_H,LAI_L,SAI_L,Llitter,Kc)

    save("data\output\throughfall.mat", "Cfol_H", "Cfol_L", "CLitter")

    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %                   Soil crust                  %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    ke = 100;
    Etm1 = 0;
    rsdf = rsd(1);
    Osatf = Osat(1);
    Ohyf = Ohy(1);
    Lf = L(1);
    Pef = Pe(1);

    save("data\input\soilcrust.mat", "dth", "ke", "Etm1", "rsdf", "Osatf", "Ohyf", "Lf", "Pef", "Ks")

    [KsC,LC,OsatC,OhyC,PeC,E]=SoilCrust(dth,ke,Etm1,rsdf,Osatf,Ohyf,Lf,Pef,Ks)


    save("data\output\soilcrust.mat", "KsC", "LC", "OsatC", "OhyC", "PeC", "E");



    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %            soil moisture rich comp            %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    numn = 16;
    t=1;
    V=ones(numn, 1);
    f=1;
    IS=1;
    aT = 3;
    Phy1 = 0;
    EG = ones(1, numn) * EG;
    T_H = ones(1, numn) * T_H(1);
    T_L = ones(1, numn) * T_L(1);
    SPAR=2;

    save('data\input\Soil_Moisture_Rich_Comp.mat', ...
    't','V','Lk','f','EG','T_H','T_L', ...
    'Qi_in','Slo_pot','IS','SPAR','Osat','Ohy','O33','dz','Ks_Zs','Dz','numn','L','Pe', ...
    'aR','aT','alpVG','nVG','lVG','Ks_mac','Omac','alpVGM','nVGM','lVGM','Phy1','s_SVG','bVG', ...
    'Zs','cosalp','sinalp','SN');


    [dV]=SOIL_MOISTURES_RICH_COMP(t,V,...
    Lk,f,EG,T_H,T_L,...
    Qi_in,Slo_pot,IS,SPAR,Osat,Ohy,O33,dz,Ks_Zs,Dz,numn,L,Pe,aR,aT,alpVG,nVG,lVG,Ks_mac,Omac,alpVGM,nVGM,lVGM,Phy1,s_SVG,bVG,Zs,cosalp,sinalp,SN)

    save("data\output\Soil_Moisture_Rich_Comp.mat", "dV")



    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %            Soil heat profile normal           %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Tup = 45;
    Ttm1 = ones(1, 16) * 30;
    cv = ones(1, 16) * 400;
    Tdown = 20;
    G0 = 300;
    Gn = 200;
    OPZ = 1;

    save("data\input\soil_heat_profile_normal.mat", "Tup","dt","Ttm1","ms","Zs","lanS","cv","Tdown","G0","Gn","OPZ");


    [G0,T,Gn]=Soil_Heat_Profile_Normal(Tup,dt,Ttm1,ms,Zs,lanS,cv,Tdown,G0,Gn,OPZ);

    save("data\output\soil_heat_profile_normal.mat", "G0", "T", "Gn");



    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %                 Heat CN normal                %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    dts = 1;
    Ttm1 = ones(1, 18) * 30;

    save("data\input\heat_cn_normal.mat", "Ttm1", "dts", "lanS", "cv", "Zs", "Tup", "Tdown", "Gn", "G0", "OPZ")
    
    [T] = Heat_CN_Normal_Function(Ttm1,dts,lanS,cv,Zs,Tup,Tdown,Gn,G0,OPZ)

    save("data\output\heat_cn_normal.mat", "T");


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %                   Heat CN FT                  %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    AE = ones(1,16) * 134;

    save('data\input\heat_cn_ft.mat', ...
    'Ttm1','dts','Pre','rsd','lan_dry','lan_s','cv_s','SPAR','L','Pe','O33','alpVG','nVG', ...
    'Phy1','s_SVG','bVG','Osat','Ohy','Oicetm1','Otm1','Zs','G0','Gn','Tup','Tdown','AE','OPZ','OPT_FR_SOIL');

    [T] = Heat_CN_FT_Function(Ttm1,dts,Pre,rsd,lan_dry,lan_s,cv_s,SPAR,L,Pe,O33,alpVG,nVG,...
    Phy1,s_SVG,bVG,Osat,Ohy,Oicetm1,Otm1,Zs,G0,Gn,Tup,Tdown,AE,OPZ,OPT_FR_SOIL)

    save("data\output\heat_cn_ft.mat", "T");


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %               Soil heat profile new           %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    OPT_ST = 1;

    Ttm1 = ones(1,16) * 30;
    G0 = NaN;

    save("data\input\soil_heat_profile_new.mat", 'Tup','dt','Ttm1','ms','dz','Zs','Pre','rsd','lan_dry','lan_s','cv_s','SPAR','L','Pe','O33','alpVG','nVG', ...
    'Phy','s_SVG','bVG','Osat','Ohy','Oicetm1','Otm1','G0','OPT_FR_SOIL','OPT_ST')

    [G0,T,O,Oice]=Soil_Heat_Profile_New(Tup,dt,Ttm1,ms,dz,Zs,Pre,rsd,lan_dry,lan_s,cv_s,SPAR,L,Pe,O33,alpVG,nVG,...
    Phy,s_SVG,bVG,Osat,Ohy,Oicetm1,Otm1,G0,OPT_FR_SOIL,OPT_ST)

    save('data\output\soil_heat_profile_new.mat', "G0", "T", "O", "Oice");



end