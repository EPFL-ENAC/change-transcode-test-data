%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% CLOSURE ENERGY BUDGET  DETERMINATION SURFACE TEMPERATURE %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[DT]=Surface_Temperature_Snow(Ts,dt,Ta,ea,Latm,SvF,Pre,...
    Csno,Crock,Curb,Cbare,Ccrown,Cwat,Cice,Cfol_H,...
    hc_H,hc_L,SnoDep,ydepth,ICE_D,Cdeb,LAI_H,LAI_L,SAI_H,SAI_L,...
    RabsbSun_vegH,RabsbShd_vegH,Rabsb_soiH,...
    RabsbSun_vegL,RabsbShd_vegL,Rabsb_soiL,FsunH,FshdH,...
    FsunL,FshdL,Rabsb_sno,Rabsb_bare,Rabsb_urb,Rabsb_wat,Rabsb_rock,Rabsb_ice,Rabsb_deb,...
    e_sno,e_gr,e_sur,Cicew,Csnow,CLitter,...
    dw_L,dw_H,dw_SNO,In_max_SWE,...
    In_H,In_L,In_urb,In_rock,SWE,In_SWE,...
    Pr_liq,Pr_sno,rs_sunH,rs_sunL,rs_shdH,rs_shdL,d_leaf_H,d_leaf_L,r_litter,r_soil,b_soil,alp_soil,...
    Tstm1,G,Tdpsnowtm1,lan_sno,...
    zatm,disp_h,zom,zoh,zom_under,disp_h_H,zom_H,disp_h_L,zom_L,Ws,In_Litter,alp_litter,Pr_sno_day,Th_Pr_sno,ros_max1,ros_max2,...
    Tdew,t_slstm1,SWEtm1,Dtm1,rostm1,SP_wctm1,In_SWEtm1,fpr,Vavail,Vavail_plant_H,Vavail_plant_L,WAT_avail,ICEtm1,OPT_VegSnow,min_SPD,TsV)
%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%
[ra]=Aerodynamic_Resistence(Ta,Ts,Pre,zatm,disp_h,zom,zoh,Ws,ea);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[rap_H,rap_L,rb_H,rb_L]=Undercanopy_Leaf_Resistence2(Ws,Ta,Ts,Ccrown,hc_H,hc_L,...
    (LAI_H+SAI_H),(LAI_L+SAI_L),d_leaf_H,d_leaf_L,...
    zatm,disp_h,zom,zom_under,SnoDep,disp_h_H,zom_H,disp_h_L,zom_L);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (dw_SNO <= 0.5) && (OPT_VegSnow==1)
    [Rnet]=Net_Radiation_Manager_SnowVeg(Ts,TsV,Latm,SvF,...
        Csno,Crock,Curb,Cwat,Cbare,Cice,Ccrown,...
        hc_L,SnoDep,ydepth,ICE_D,LAI_H,LAI_L,SAI_H,SAI_L,...
        RabsbSun_vegH,RabsbShd_vegH,Rabsb_soiH,...
        RabsbSun_vegL,RabsbShd_vegL,Rabsb_soiL,FsunH,FshdH,...
        FsunL,FshdL,Rabsb_sno,Rabsb_bare,Rabsb_urb,Rabsb_wat,Rabsb_rock,Rabsb_ice,...
        e_sno,e_gr,e_sur,Cicew,Csnow);
else
    %%% Net Radiation
    [Rnet]=Net_Radiation_Manager(Ts,Latm,SvF,...
        Csno,Crock,Curb,Cwat,Cbare,Cice,Ccrown,...
        hc_L,SnoDep,ydepth,ICE_D,Cdeb,LAI_H,LAI_L,SAI_H,SAI_L,...
        RabsbSun_vegH,RabsbShd_vegH,Rabsb_soiH,...
        RabsbSun_vegL,RabsbShd_vegL,Rabsb_soiL,FsunH,FshdH,...
        FsunL,FshdL,Rabsb_sno,Rabsb_bare,Rabsb_urb,Rabsb_wat,Rabsb_rock,Rabsb_ice,Rabsb_deb,...
        e_sno,e_gr,e_sur,Cicew,Csnow);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Heat Fluxes
[H,QE,Qv,T_H,T_L,EIn_H,EIn_L,EG,ESN,ESN_In]=Heat_fluxes(dt,...
    Ta,Ts,ea,Pre,Csno,Crock,Curb,Cwat,Cbare,Cice,Cicew,Csnow,CLitter,Cdeb,...
    dw_L,dw_H,dw_SNO,Ccrown,FsunH,FshdH,...
    FsunL,FshdL,LAI_H,LAI_L,SAI_H,SAI_L,...
    In_H,In_L,In_urb,In_rock,SWE,In_SWE,...
    Pr_liq,Pr_sno,ra,rs_sunH,rs_sunL,rs_shdH,rs_shdL,rb_H,rb_L,rap_H,rap_L,r_litter,...
    r_soil,b_soil,alp_soil,Vavail,Vavail_plant_H,Vavail_plant_L,WAT_avail,ICEtm1,In_Litter,alp_litter);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Heat Flux through the snow
if (Dtm1) > min_SPD

    [TsF]=Snowpacks_2layers(dt,...
        Ta,Ts,Tstm1,Tdpsnowtm1,Tdew,Ws,t_slstm1,SWEtm1,Dtm1,rostm1,SP_wctm1,In_SWEtm1,In_max_SWE,dw_SNO,...
        Pr_liq,Pr_sno,ESN,ESN_In,Rnet,H,QE,G,Qv,Csnow,Ccrown,Cwat,Cfol_H,fpr,Pr_sno_day,Th_Pr_sno,ros_max1,ros_max2,lan_sno,min_SPD);

    %%%%%%% Difference Temperature
    DT = TsF -Ts ;
else
    %%%% Snow cover not deep enough to compute the temperature profile.
    %%%%
    %%% G = G

    %%%% Snowpacks
    [TsF]=Snowpacks(dt,...
        Ta,Ts,Tstm1,Tdew,Ws,t_slstm1,SWEtm1,Dtm1,rostm1,SP_wctm1,In_SWEtm1,In_max_SWE,dw_SNO,...
        Pr_liq,Pr_sno,ESN,ESN_In,Rnet,H,QE,G,Qv,Csnow,Ccrown,Cwat,Cfol_H,fpr,Pr_sno_day,Th_Pr_sno,ros_max1,ros_max2);
    %%%%%%% Difference Temperature
    DT = TsF -Ts;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
return


