function genData()

    load("workspaceBegin.mat");

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%  Value of the Volume  -- V
    %%% Initial Condition --->  Vtm1
    %%%%%%%%
    save("data\input\Soil_Water_Multilayer.mat",'Vtm1','Zs',...
        'dz','ms','Ccrown','Osat','Ohy','nVG','alpVG','lVG','Ks_Zs','L','Pe','O33','Ks_mac','Omac','alpVGM','nVGM','lVGM','s_SVG','bVG','Phy','SPAR','EvL_Zs','Inf_Zs','RfH_Zs','RfL_Zs',...
        'Rrootl_H','Rrootl_L','PsiL50_H','PsiL50_L','PsiX50_H','PsiX50_L','Tstm1','Tdptm1','Psi_sto_00_H','Psi_sto_50_H','Psi_sto_00_L','Psi_sto_50_L',...
        'Salt','Osm_reg_Max_H','Osm_reg_Max_L','eps_root_base_H','eps_root_base_L');

    [Otm1,ZWTtm1,OFtm1,OStm1,Psi_stm1_H,Psi_stm1_L,gsr_Htm1,gsr_Ltm1,Exwat_Htm1,Exwat_Ltm1]=Soil_Water_MultiLayer(Vtm1,Zs,...
        dz,ms,Ccrown,Osat,Ohy,nVG,alpVG,lVG,Ks_Zs,L,Pe,O33,Ks_mac,Omac,alpVGM,nVGM,lVGM,s_SVG,bVG,Phy,SPAR,EvL_Zs,Inf_Zs,RfH_Zs,RfL_Zs,...
        Rrootl_H,Rrootl_L,PsiL50_H,PsiL50_L,PsiX50_H,PsiX50_L,Tstm1,Tdptm1,Psi_sto_00_H,Psi_sto_50_H,Psi_sto_00_L,Psi_sto_50_L,...
        Salt,Osm_reg_Max_H,Osm_reg_Max_L,eps_root_base_H,eps_root_base_L);

    save( "data\output\Soil_water_Multilayer.mat",'Otm1','ZWTtm1','OFtm1','OStm1','Psi_stm1_H','Psi_stm1_L','gsr_Htm1','gsr_Ltm1','Exwat_Htm1','Exwat_Ltm1');

    %%%%%%%%%%%%%%%
    %%%%%% Thermal properties soil
    if Crock ==1 || Curb ==1  || Cwat ==1
        save("data\input\Other_Thermal_properties.mat",'Cwat','Curb','Crock','ms')
        [lan_oth,cv_oth,CTt_oth]=Other_Thermal_properties(Cwat,Curb,Crock,ms);
        save("data\output\Other_Thermal_properties.mat",'lan_oth','cv_oth','CTt_oth')
        CTt=[];
    else
        test = (Otm1+Oicetm1);
        save("data\input\Soil_Thermal_properties_FT.mat",'Tdptm1','Pre','rsd','lan_dry','lan_s','cv_s','SPAR','L','Pe','O33','alpVG','nVG','Phy','s_SVG','bVG','Osat','Ohy','test','OPT_FR_SOIL')
        [~,~,CTt]=Soil_Thermal_properties_FT(Tdptm1,Pre,rsd,lan_dry,lan_s,cv_s,SPAR,L,Pe,O33,alpVG,nVG,...
            Phy,s_SVG,bVG,Osat,Ohy,(Otm1+Oicetm1),OPT_FR_SOIL);
        save("data\output\Soil_Thermal_properties_FT.mat",'CTt')
        lan_oth=[];cv_oth=[];CTt_oth=[]; 
    end
    %%%%%
    %%%%% Incoming Longwave  %%%%%%%%%%%
    save("data\input\Incoming_Longwave.mat",'Ta','ea','N');
    [Latm,N]=Incoming_Longwave(Ta,ea,N); % Latm Incoming LongWave Radiation [W/m^2]
    save("data\output\Incoming_Longwave.mat",'Latm','N');

    %%%%% Sun height
    save("data\input\SetSunVariables.mat",'Datam','DeltaGMT','Lon','Lat','t_bef','t_aft');
    [h_S]=SetSunVariables(Datam,DeltaGMT,Lon,Lat,t_bef,t_aft);
    save("data\output\SetSunVariables.mat",'h_S');

    %%%%%%%%%%%%%%%%%%%%%%%%% Account for the water logging
    % >--- OS [ Superficial Soil ]
    save("data\input\Soil_Resistence.mat",'Tdptm1','Pre','Ws_undertm1','ea','q_runon','OStm1','Ks_Zs','Osat','Ohy','L','Pe','O33','alpVG','nVG','lVG',...
        'Ks_mac','Omac','alpVGM','nVGM','lVGM','Phy','s_SVG','bVG','SPAR');
    [r_soil,b_soil,alp_soil]=Soil_Resistence(Tdptm1(1),Pre,Ws_undertm1,ea,q_runon,OStm1,Ks_Zs(1),Osat(1),Ohy(1),L(1),Pe(1),O33(1),alpVG(1),nVG(1),lVG(1),...
        Ks_mac(1),Omac(1),alpVGM(1),nVGM(1),lVGM(1),Phy,s_SVG(1),bVG(1),SPAR); %%
    save("data\output\Soil_Resistence.mat",'r_soil','b_soil','alp_soil');

    %%% Theoretically Ks_Zs should be reduced when soil is frozen 
    %%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%
    %%%%%% RADIATION INPUT MANAGEMENT
    Rsw.dir_vis = SAB1;
    Rsw.dir_nir = SAB2;
    Rsw.dif_vis = SAD1;
    Rsw.dif_nir = SAD2;
    PAR.dir = PARB;
    PAR.dif = PARD;
    clear SAB1 SAB2 SAD1 SAD2 PARB PARD
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%% SVAT MANAGER
    save("data\input\SVAT_UNIT.mat",'Tstm0','Pr','Ta','Ds','Ws','zatm','Tstm1','Tstm1_under','dt','ea','Latm','N','Pre',...
        'OStm1','Psi_stm1_H','Psi_stm1_L','gsr_Htm1','gsr_Ltm1','Exwat_Htm1','Exwat_Ltm1',....
        'LAI_H','SAI_H','LAI_L','SAI_L','LAIdead_H','LAIdead_L','BLit','Sllit','Kct','TminS','TmaxS',...
        'Sp_SN_In','Sp_LAI_L_In','Sp_LAI_H_In','h_S',...
        'Ccrown','Cbare','Crock','Curb','Cwat','ydepth','Ccrown_L',...
        'Rsw','PAR','SvF','SNDtm1','snow_albtm1','Color_Class','OM_H','OM_L',...
        'PFT_opt_H','PFT_opt_L','hc_H','hc_L','d_leaf_H','d_leaf_L',...
        'r_soil','b_soil','alp_soil','gcI','KcI',...
        'KnitH','KnitL','mSl_H','Sl_H','mSl_L','Sl_L','Ca','Oa','Citm1_sunH','Citm1_shdH','CT_H','Citm1_sunL','Citm1_shdL','CT_L','Vmax_H','Vmax_L','FI_H','FI_L','a1_H','go_H','a1_L','go_L',...
        'DSE_H','Ha_H','Do_H','e_rel_H','e_relN_H','DSE_L','Ha_L','Do_L','e_rel_L','e_relN_L','gmes_H','rjv_H','gmes_L','rjv_L',...
        'e_snotm1','In_Htm1','In_Ltm1','In_Littertm1','In_urbtm1','In_rocktm1','SWEtm1','In_SWEtm1',....
        'Oicetm1','Otm1','Tdptm1','Tdpsnowtm1','Tdamptm1','Ticetm1','dz','Zs','ms','rsd','lan_dry','lan_s','cv_s','SPAR','L','Pe','O33','alpVG','nVG','Phy','s_SVG','bVG','Osat','Ohy','CTt',...
        'lan_oth','cv_oth','CTt_oth','Zs_deb','Deb_Par','Tdebtm1',...
        'Tdew','t_slstm1','rostm1','SP_wctm1','fpr','WatFreez_Th','dz_ice',...
        'Pr_sno_day','Th_Pr_sno','ros_max1','ros_max2',...
        'Urb_Par','In_max_urb','In_max_rock','tau_snotm1','Ta_day','Ws_undertm1',...
        'EvL_Zs','RfH_Zs','RfL_Zs','Vtm1','WATtm1',...
        'ICEtm1','IP_wctm1','ICE_Dtm1','Ice_wc_sp','ros_Ice_thr','Aice','Cicewtm1',...
        'Vxtm1_H','Vltm1_H','Vxtm1_L','Vltm1_L','Psi_xtm1_H','Psi_ltm1_H','Psi_xtm1_L','Psi_ltm1_L',...
        'Psi_sto_50_H','Psi_sto_00_H','ZR95_H',...
        'Psi_sto_50_L','Psi_sto_00_L','ZR95_L',...
        'Axyl_H','PsiL50_H','PsiL00_H','Kleaf_max_H','Cl_H','Kx_max_H','PsiX50_H','Cx_H',...
        'Axyl_L','PsiL50_L','PsiL00_L','Kleaf_max_L','Cl_L','Kx_max_L','PsiX50_L','Cx_L',...
        'OPT_min_SPD','OPT_VegSnow','OPT_SoilTemp','OPT_PlantHydr','Opt_CR','Opt_ST','Opt_ST2','OPT_STh','OPT_FR_SOIL','OPT_PH')
    [Ts,Pr_sno,Pr_liq,Ws_under,Csno,Cice,Cfol_H,Cfol_L,CLitter,NDVI,rb_H,rb_L,rs_sunH,rs_sunL,rs_shdH,rs_shdL,r_litter,...
        An_L,An_H,Rdark_L,Rdark_H,Ci_sunH,Ci_sunL,Ci_shdH,Ci_shdL,rap_H,rap_L,ra,Rn,...
        H,QE,Qv,Lpho,T_H,T_L,EIn_H,EIn_L,EG,ESN,ESN_In,EWAT,EICE,ELitter,EIn_urb,EIn_rock,dw_SNO,...
        G,Gfin,Tdp,Tdpsnow,Oint,Oice,Tdamp,Tdeb,Tice,SWE,SND,ros,In_SWE,SP_wc,WR_SP,U_SWE,NIn_SWE,dQ,Qfm,t_sls,DQ,DT,...
        In_H,In_L,In_Litter,In_urb,In_rock,Dr_H,Dr_L,SE_rock,SE_urb,WIS,...
        ICE,ICE_D,IP_wc,WR_IP,NIce,Cicew,Csnow,...
        snow_alb,tau_sno,e_sno,...
        fapar_H,fapar_L,SIF_H,SIF_L,...
        gsr_H,Psi_x_H,Psi_l_H,Jsx_H,Jxl_H,Kleaf_H,Kx_H,Vx_H,Vl_H,...
        gsr_L,Psi_x_L,Psi_l_L,Jsx_L,Jxl_L,Kleaf_L,Kx_L,Vx_L,Vl_L,...
        dQVEG,HV,QEV,TsV,Ts_under,WAT,q_run,EG_dis,J_Hdis,J_Ldis,Imelt,Smelt]=SVAT_UNIT(Tstm0,Pr,Ta,Ds,Ws,zatm,Tstm1,Tstm1_under,dt,ea,Latm,N,Pre,...
        OStm1,Psi_stm1_H,Psi_stm1_L,gsr_Htm1,gsr_Ltm1,Exwat_Htm1,Exwat_Ltm1,....
        LAI_H,SAI_H,LAI_L,SAI_L,LAIdead_H,LAIdead_L,BLit,Sllit,Kct,TminS,TmaxS,...
        Sp_SN_In,Sp_LAI_L_In,Sp_LAI_H_In,h_S,...
        Ccrown,Cbare,Crock,Curb,Cwat,ydepth,Ccrown_L,...
        Rsw,PAR,SvF,SNDtm1,snow_albtm1,Color_Class,OM_H,OM_L,...
        PFT_opt_H,PFT_opt_L,hc_H,hc_L,d_leaf_H,d_leaf_L,...
        r_soil,b_soil,alp_soil,gcI,KcI,...
        KnitH,KnitL,mSl_H,Sl_H,mSl_L,Sl_L,Ca,Oa,Citm1_sunH,Citm1_shdH,CT_H,Citm1_sunL,Citm1_shdL,CT_L,Vmax_H,Vmax_L,FI_H,FI_L,a1_H,go_H,a1_L,go_L,...
        DSE_H,Ha_H,Do_H,e_rel_H,e_relN_H,DSE_L,Ha_L,Do_L,e_rel_L,e_relN_L,gmes_H,rjv_H,gmes_L,rjv_L,...
        e_snotm1,In_Htm1,In_Ltm1,In_Littertm1,In_urbtm1,In_rocktm1,SWEtm1,In_SWEtm1,....
        Oicetm1,Otm1,Tdptm1,Tdpsnowtm1,Tdamptm1,Ticetm1,dz,Zs,ms,rsd,lan_dry,lan_s,cv_s,SPAR,L,Pe,O33,alpVG,nVG,Phy,s_SVG,bVG,Osat,Ohy,CTt,...
        lan_oth,cv_oth,CTt_oth,Zs_deb,Deb_Par,Tdebtm1,...
        Tdew,t_slstm1,rostm1,SP_wctm1,fpr,WatFreez_Th,dz_ice,...
        Pr_sno_day,Th_Pr_sno,ros_max1,ros_max2,...
        Urb_Par,In_max_urb,In_max_rock,tau_snotm1,Ta_day,Ws_undertm1,...
        EvL_Zs,RfH_Zs,RfL_Zs,Vtm1,WATtm1,...
        ICEtm1,IP_wctm1,ICE_Dtm1,Ice_wc_sp,ros_Ice_thr,Aice,Cicewtm1,...
        Vxtm1_H,Vltm1_H,Vxtm1_L,Vltm1_L,Psi_xtm1_H,Psi_ltm1_H,Psi_xtm1_L,Psi_ltm1_L,...
        Psi_sto_50_H,Psi_sto_00_H,ZR95_H,...
        Psi_sto_50_L,Psi_sto_00_L,ZR95_L,...
        Axyl_H,PsiL50_H,PsiL00_H,Kleaf_max_H,Cl_H,Kx_max_H,PsiX50_H,Cx_H,...
        Axyl_L,PsiL50_L,PsiL00_L,Kleaf_max_L,Cl_L,Kx_max_L,PsiX50_L,Cx_L,...
        OPT_min_SPD,OPT_VegSnow,OPT_SoilTemp,OPT_PlantHydr,Opt_CR,Opt_ST,Opt_ST2,OPT_STh,OPT_FR_SOIL,OPT_PH);

        save("data\output\SVAT_UNIT.mat",'Ts','Pr_sno','Pr_liq','Ws_under','Csno','Cice','Cfol_H','Cfol_L','CLitter','NDVI','rb_H','rb_L','rs_sunH','rs_sunL','rs_shdH','rs_shdL','r_litter',...
        'An_L','An_H','Rdark_L','Rdark_H','Ci_sunH','Ci_sunL','Ci_shdH','Ci_shdL','rap_H','rap_L','ra','Rn',...
        'H','QE','Qv','Lpho','T_H','T_L','EIn_H','EIn_L','EG','ESN','ESN_In','EWAT','EICE','ELitter','EIn_urb','EIn_rock','dw_SNO',...
        'G','Gfin','Tdp','Tdpsnow','Oint','Oice','Tdamp','Tdeb','Tice','SWE','SND','ros','In_SWE','SP_wc','WR_SP','U_SWE','NIn_SWE','dQ','Qfm','t_sls','DQ','DT',...
        'In_H','In_L','In_Litter','In_urb','In_rock','Dr_H','Dr_L','SE_rock','SE_urb','WIS',...
        'ICE','ICE_D','IP_wc','WR_IP','NIce','Cicew','Csnow',...
        'snow_alb','tau_sno','e_sno',...
        'fapar_H','fapar_L','SIF_H','SIF_L',...
        'gsr_H','Psi_x_H','Psi_l_H','Jsx_H','Jxl_H','Kleaf_H','Kx_H','Vx_H','Vl_H',...
        'gsr_L','Psi_x_L','Psi_l_L','Jsx_L','Jxl_L','Kleaf_L','Kx_L','Vx_L','Vl_L',...
        'dQVEG','HV','QEV','TsV','Ts_under','WAT','q_run','EG_dis','J_Hdis','J_Ldis','Imelt','Smelt')
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%% All of the variable over Asur (normal coordinates) %%%%%%%%%%%%%%%%%%%%%%%%
    %%% Pr_sno Pr_liq An_L An_H Rdark_H Rdark_L Rn H QE Qv T_H T_L EIn_H EIn_L
    %%% ELitter WIS In_Litter
    %%% EG ESN ESN_In EWAT EICE EIn_urb EIn_rock G SWE SND In_SWE SP_wc WR_SP Qfm
    %%% In_H In_L In_urb In_rock Dr_H Dr_L ICE ICE_D IP_wc WR_IP NIce EG_dis THdis T_Ldis
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if OPT_FR_SOIL == 1
        fQ= (Oice)./(Oice+Oint+1e-5-Ohy); %%[-]
        Kfro = 10.^(-5.*fQ).*Ks_Zs; %% Hansson et al 2004
        Ks_Zs=Kfro ;
    end
    %%%%%%%%%%%%%
    q_runon = q_run;  %% [mm/h]
    ydepth = q_runon*dth; %% [mm]  su Asur
    WATtm1 = WAT;   %% [mm] %% It changes only in case of freezing lakes or in case Cwat < 1 
    %%%%%%
    WIS=WIS+IrD*dth; %%% Drip Irrigation added;; % [mm]
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if not(Crock ==1 || Curb ==1  || Cwat ==1)
        %%%%%%%%% NORMAL CASE OF SOIL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if  isnan(a_dis(1,1)) ||  Pr_liq == 0
            %%% Erosion
            save("data\input\Erosion.mat",'dt','Pr_liq','hc_H','hc_L','K_usle','Ccrown','Cbare','Csno','Cfol_H','Cfol_L','CLitter','Dr_H','Dr_L');
            [er,ke]=Erosion(dt,Pr_liq,hc_H,hc_L,K_usle,Ccrown,Cbare,Csno,Cfol_H,Cfol_L,CLitter,Dr_H,Dr_L); %%%
            save("data\output\Erosion.mat",'er','ke');
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %%% Soil Sealing and Crust
            if (ke == 0) || isnan(a_dis(1,1));
                EK = 0; KsC=Ks_Zs(1); LC=L(1); OsatC=Osat(1); OhyC=Ohy(1); PeC=Pe(1);
            else
                save("data\input\SoilCrust.mat",'dth','ke','EKtm1','rsd','Osat','Ohy','L','Pe','Ks_Zs');
                [KsC,LC,OsatC,OhyC,PeC,EK]=SoilCrust(dth,ke,EKtm1,rsd(1),Osat(1),Ohy(1),L(1),Pe(1),Ks_Zs(1));
                save("data\output\SoilCrust.mat",'KsC','LC','OsatC','OhyC','PeC','EK');
            end
            %%%% WIS = [mm] Water Incoming to First Soil Layer
            WIS= WIS/dth; %%% [mm/h]
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save("data\input\Infiltration_2.mat",'OsatC','OhyC','LC','alpVG','nVG','lVG','PeC','KsC','O33','Ks_mac','Omac','alpVGM','nVGM','lVGM','Phy','s_SVG','bVG','SPAR','OStm1','Zinf','WIS','cosalp','ydepth');
            [f]=Infiltration_2(OsatC,OhyC,LC,alpVG(1),nVG(1),lVG(1),PeC,KsC,O33(1),Ks_mac(1),Omac(1),alpVGM(1),nVGM(1),lVGM(1),Phy,s_SVG(1),bVG(1),SPAR,OStm1,Zinf,WIS,cosalp,ydepth);  %% [mm/h]  %% <--- OS First Layer
            save("data\output\Infiltration_2.mat",'f');
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            Rh = (WIS-f)*dth; %%% [mm] Horton Runoff
            WIS=WIS*dth; %% [mm]
        else
            %%%% CASE with 5 min rainfall
            %%%%%%%% Rainfall Disaggregation
            dti=300; %%[s]
            dtih= dti/dt; %%[h]
            save("data\input\Disaggregator_Pr.mat",'Pr_liq','dth','pow_dis','a_dis');
            [Pr_liq_dis]=Disaggregator_Pr(Pr_liq*dth,pow_dis,a_dis);
            save("data\output\Disaggregator_Pr.mat",'Pr_liq_dis');
            WIScon = WIS-sum(Pr_liq_dis); %% [mm]
            if WIScon < 0
                Pr_liq_dis = Pr_liq_dis*WIS./(sum(Pr_liq_dis)); % [mm]
                WIScon =0 ;
            end
            Pr_liq_dis=Pr_liq_dis/dtih; %%% disaggregated precipitation [mm/h]
            %%%%
            er=zeros(1,length(Pr_liq_dis));
            ke=zeros(1,length(Pr_liq_dis));
            f=zeros(1,length(Pr_liq_dis));
            WISvar=zeros(1,length(Pr_liq_dis));
            for jk=1:length(Pr_liq_dis)
                %%%%%% Erosion
                save("data\input\Erosion.mat",'dti','Pr_liq_dis','hc_H','hc_L','K_usle','Ccrown','Cbare','Csno','Cfol_H','Cfol_L','CLitter','Dr_H','Dr_L');
                [er(jk),ke(jk)]=Erosion(dti,Pr_liq_dis(jk),hc_H,hc_L,K_usle,Ccrown,Cbare,Csno,Cfol_H,Cfol_L,CLitter,Dr_H,Dr_L);
                save("data\output\Erosion.mat",'er','ke');
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                %%% Soil Sealing and Crust
                save("data\input\SoilCrust.mat",'dtih','ke','EKtm1','rsd','Osat','Ohy','L','Pe','Ks_Zs');
                [KsC,LC,OsatC,OhyC,PeC,EK]=SoilCrust(dtih,ke(jk),EKtm1,rsd(1),Osat(1),Ohy(1),L(1),Pe(1),Ks_Zs(1));
                save("data\output\SoilCrust.mat",'KsC','LC','OsatC','OhyC','PeC','EK');
                EKtm1=EK;
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                %%%% WIS = Water Incoming to First Soil Layer
                WISvar(jk)= Pr_liq_dis(jk) + WIScon/dth ; %%% [mm/h]
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%% Only for SPAR == 2 - Saxton and  Rawls 
                save("data\input\Infiltration_2.mat",'OsatC','OhyC','LC','0','0','0','PeC','KsC','O33','Ks_mac','Omac','alpVGM','nVGM','lVGM','Phy','s_SVG','bVG','2','OStm1','Zinf','WISvar','cosalp','ydepth');
                test=Infiltration_2(OsatC,OhyC,LC,0,0,0,PeC,KsC,O33(1),Ks_mac(1),Omac(1),alpVGM(1),nVGM(1),lVGM(1),Phy,s_SVG(1),bVG(1),2,OStm1,Zinf,WISvar(jk),cosalp,ydepth);
                [f(jk)]=Infiltration_2(OsatC,OhyC,LC,0,0,0,PeC,KsC,O33(1),Ks_mac(1),Omac(1),alpVGM(1),nVGM(1),lVGM(1),Phy,s_SVG(1),bVG(1),2,OStm1,Zinf,WISvar(jk),cosalp,ydepth);  %% [mm/h]  %% <--- OS First Layer
                save("data\output\Infiltration_2.mat",'test');
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            end
            Rh = (WISvar-f)*dtih; %%% [mm] Horton Runoff
            %%%%%%%%%%%%%%%%
            %%%%%%%%%%%%%%%%
            Rh=sum(Rh); % [mm]
            f=sum(f*dtih)/dth;  % [mm/h]
            %WIS=sum(WISvar*dtih); %[mm]
            er=sum(er*dtih)/dth; %%  [kg/h m^2]
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%% Soil Bottom Leakage
        [Lk]=Leakage_Bottom(Otm1,Ks_Zs,Osat,Ohy,L,alpVG,nVG,lVG,Ks_mac,Omac,alpVGM,nVGM,lVGM,Kbot,ms,SPAR); %%% [mm/h]
        Lk=Lk*Ared; %% due to less available area
        %%%%%%%%%%
    else
        %%%% No SOIL
        Rh = 0;  f = 0;  Lk = 0;  er = 0;  EK = 0; %WIS = 0;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%  WATER
    if Cwat > 0
        WAT = WATtm1 - EWAT*dth + (WR_SP*(1-Cice)+WR_IP)*Cwat + Cwat*dth*(Pr_liq*(1-Csnow)*(1-Cicew) + Pr_sno*(1-Cicew)*(1-Csnow)) + q_runon*dth*Cwat  + sum(Qi_in)*dth*Cwat; %%[mm]
        save("data\input\Leakage_Water.mat",'Kwat','WAT','dth');
        [Lk_wat]=Leakage_Rock(Krock,WAT,dth); %% [mm]
        save("data\output\Leakage_Water.mat",'Lk_wat');
        WAT=WAT-Lk_wat;
    else
        Lk_wat = 0;
        WAT = 0;
    end
    %%%%% URBAN
    if Curb > 0
        save("data\input\Leakage_Urban.mat",'Kurb','In_urb','dth');
        [Lk_urb]=Leakage_Rock(Krock,In_urb,dth); %% [mm]
        save("data\output\Leakage_Urban.mat",'Lk_urb');
        In_urb=In_urb-Lk_urb;
    else
        Lk_urb = 0;
    end
    %%%%%%%%%% ROCK  %%%%%%%%%%%%%%%%%
    save("data\input\Leakage_Rock.mat",'Krock','In_rock','dth');
    [Lk_rock]=Leakage_Rock(Krock,In_rock,dth); %% [mm/h]
    save("data\output\Leakage_Rock.mat",'Lk_rock');
    In_rock = In_rock - Lk_rock; %%[mm]
    %%% Fracture Rocks Storage
    FROCK = FROCKtm1 + Lk + Lk_wat + Lk_urb + Lk_rock + Crock*sum(Qi_in)*dth; %%[mm]
    %%%% Total Horton Runoff
    Rh = Rh + SE_rock + SE_urb; %%[mm]
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%% Simplify Richards Model
    %%% Initial Condition --->  V- Values
    if Crock ==1 || Curb ==1 || Cwat ==1
        if OPT_FR_SOIL == 1
            V=(Oint-Ohy).*dz;
            Vice =(Oice).*dz;
            Rd_cryo=0; 
        else
            V=Vtm1;
            Vice=V*0;
            Rd_cryo=0; 
        end
        
    else
        %%%%%%%%%%%%%%%%%%%
        %%% V over Asur and Ared (for rock content in the soil)
        %%% Operations over Ared
        f=f/Ared; Qi_in=Qi_in/Ared;  Lk=Lk/Ared;
        EG_dis=EG_dis/Ared; J_Hdis=J_Hdis/Ared; J_Ldis=J_Ldis/Ared;
        %%%%%%%%%%%%%%%%%%%
        V0 =Vtm1;
        T_SPAN = [0 dth]; 
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if OPT_FR_SOIL == 1
            %%% Potentially reduced water content because of freezing 
            V0 = (Oint-Ohy).*dz; %%% [mm]
        else
            Oice = 0*Oice; 
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %Param.Osat = Osat; Param.Ohy = Ohy; Param.O33 = O33;
        %Param.dz = dz; Param.Ks_Zs =Ks_Zs; Param.Dz = Dz; Param.ms = ms;
        %Param.L = L; Param.Pe = Pe; Param.aR =aR; Param.aTop = aTop;
        %Param.alpVG=alpVG; Param.nVG = nVG; Param.Zs=Zs;
        %Param.cosalp=cosalp; Param.sinalp=sinalp; Param.SN=SN;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        ISeep =  ones(1,ms) ; %% Otm1 >= Osat-0.005 ;  %%% Decision to Seep
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        save("data\input\SOIL_MOISTURES_RICH_COMP.mat",'T_SPAN','V0','OPT_SM',...
            'Lk','f','EG_dis','J_Hdis','J_Ldis',...
            'Qi_in','Slo_pot','ISeep','SPAR','Osat','Ohy','O33','dz','Ks_Zs','Dz','ms','L','Pe','aR','aTop','alpVG','nVG','lVG',...
            'Ks_mac','Omac','alpVGM','nVGM','lVGM','Phy','s_SVG','bVG','Zs','cosalp','sinalp','SN');
        [Tout,Vout]=ode23s(@SOIL_MOISTURES_RICH_COMP,T_SPAN,V0,OPT_SM,...
            Lk,f,EG_dis,sum(J_Hdis,1),sum(J_Ldis,1),...
            Qi_in,Slo_pot,ISeep,int32(SPAR),Osat,Ohy,O33,dz,Ks_Zs,Dz,int32(ms),L,Pe,aR,aTop,alpVG,nVG,lVG,...
            Ks_mac,Omac,alpVGM,nVGM,lVGM,Phy,s_SVG,bVG,Zs,cosalp,sinalp,int32(SN));
        save("data\output\SOIL_MOISTURES_RICH_COMP.mat",'Tout','Vout');
        %%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %    [Tout,Vout]=ode23s(@SOIL_MOISTURES_RICH,T_SPAN,V0,OPT_SM,...
        %    Lk,f,EG_dis,sum(J_Hdis,1),sum(J_Ldis,1),...
        %    Qi_in,Slo_pot,ISeep,SPAR,Param);
        %%%%%%%%%%%%%%%%%%%%%%%%
        V = Vout(end,:); % [mm/h] su Asur
        if OPT_FR_SOIL == 1
            save("data\input\Cryosuction_stabilizer.mat",'Oice','V','dz','Osat','Ohy');
            [V,~,Rd_cryo] = Cryosuction_stabilizer(Oice,V,dz,Osat,Ohy);
            save("data\output\Cryosuction_stabilizer.mat",'V','Rd_cryo');
            Vice = (Oice).*dz;
        else
            Vice = (Oice).*dz;
            Rd_cryo=0; 
        end
            %%%%%%%%%%%%%%%%%%%%%%
        if isnan(sum(V))
            %%%%%%%%%%%%%%%
            disp('NaN values in the Volumes')
            return
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [O,ZWT,OF,OS,Psi_s_H,Psi_s_L,gsr_H,gsr_L,Exwat_H,Exwat_L,Rd,WTR,POT,OH,OL]=Soil_Water_MultiLayer(V,Zs,...
        dz,ms,Ccrown,Osat,Ohy,nVG,alpVG,lVG,Ks_Zs,L,Pe,O33,Ks_mac,Omac,alpVGM,nVGM,lVGM,s_SVG,bVG,Phy,SPAR,EvL_Zs,Inf_Zs,RfH_Zs,RfL_Zs,...
        Rrootl_H,Rrootl_L,PsiL50_H,PsiL50_L,PsiX50_H,PsiX50_L,Ts,Tdp,Psi_sto_00_H,Psi_sto_50_H,Psi_sto_00_L,Psi_sto_50_L,...
        Salt,Osm_reg_Max_H,Osm_reg_Max_L,eps_root_base_H,eps_root_base_L);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%% 
    [Tdp_H,Tdp_L]=RootZone_Temp(Tdp,RfH_Zs,RfL_Zs);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Qi_out, [mm] Lateral Flow outgoing  [1....m]
    %Qi_in [mm] Lateral Flow incoming    [1....m]
    Qi_out=zeros(1,ms);
    if not(Crock ==1 || Curb ==1 || Cwat ==1)
        for jk = 2:length(Tout)
            %%%%%%%%%%
            Oor = 0.5*(Vout(jk,:)+Vout(jk-1,:))./dz + Ohy ; %%[-]
            I1 = Oor >= Osat-1e-5; I2 = Oor <= Ohy;
            Oor(I1)=Osat(I1); Oor(I2)=Ohy(I2)+1e-9;
            %%%%%%%%
            Ser = (Oor-Ohy)./(Osat-Ohy);
            mVG= 1-1./nVG;
            if SPAR == 1
                Kor= aR.*Ks_Zs.*((Ser).^(0.5)).*(1-(1-(Ser).^(1./mVG)).^mVG).^2; %%% [mm/h]
            else
                if SPAR == 2
                    Kor = aR.*Ks_Zs.*(Oor./Osat).^(3+(2./L)); %%% <<<---
                elseif SPAR == 3
                    save("data\input\Conductivity_Suction.mat",'SPAR','Ks_Zs','Osat','Ohy','L','Pe','O33','alpVG','nVG','lVG','Ks_mac','Omac','alpVGM','nVGM','lVGM','Phy','s_SVG','bVG','Oor');
                    [Kor]=Conductivity_Suction(SPAR,Ks_Zs,Osat,Ohy,L,Pe,O33,alpVG,nVG,lVG,Ks_mac,Omac,alpVGM,nVGM,lVGM,Phy,s_SVG,bVG,Oor);
                    save("data\output\Conductivity_Suction.mat",'Kor');
                end
            end 
            %%%%%%%%%%%%%%%
            save("data\input\Lateral_Subsurface_Flow.mat",'Kor','dz','Slo_pot','aTop','cosalp','sinalp','SN','ISeep');
            [Qi_out_t]=Lateral_Subsurface_Flow(Kor,dz,Slo_pot,aTop,cosalp,sinalp,SN,ISeep);
            save("data\output\Lateral_Subsurface_Flow.mat",'Qi_out_t');
            Qi_out = Qi_out + Qi_out_t*(Tout(jk)-Tout(jk-1)); %%% [mm]
            %%%%%%%%%%%%%%%
        end
        Qi_out=Qi_out/dth; %% [mm/h]
        %%%%%%%%%%%%%%%  Volume Correction for Rd and WTR
        V(1) = V(1) +  WTR(2) - Rd;
        V(2:end-1)= V(2:end-1)+ (WTR(3:end) - WTR(2:end-1));
        V(end)= V(end) - WTR(end);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%% Volume Compensation -- Negative Value - %%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if sum(V < 0) > 0 
            EG=EG/Ared; Jsx_H=Jsx_H/Ared; Jsx_L=Jsx_L/Ared;
            save("data\input\Volume_Correction.mat",'V','EvL_Zs','RfH_Zs','RfL_Zs','EG','Jsx_H','Jsx_L','Lk');
            [V,Jsx_H,Jsx_L,EG,Lk]=Volume_Correction(V,EvL_Zs,RfH_Zs,RfL_Zs,EG,Jsx_H,Jsx_L,Lk);
            save("data\output\Volume_Correction.mat",'V','Jsx_H','Jsx_L','EG','Lk');
            EG=EG*Ared; Jsx_H=Jsx_H*Ared; Jsx_L=Jsx_L*Ared;
            %disp('Negative Volumes')
        end
    end
end