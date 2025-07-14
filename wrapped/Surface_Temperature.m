function [DQ] = Surface_Temperature(Ts,dt,Ta,ea,Latm,SvF,Pre, Csno,Crock,Curb,Cbare,Ccrown,Cwat,Cice, hc_H,hc_L,SnoDep,ydepth,ICE_D,Cdeb,LAI_H,LAI_L,SAI_H,SAI_L, RabsbSun_vegH,RabsbShd_vegH,Rabsb_soiH, RabsbSun_vegL,RabsbShd_vegL,Rabsb_soiL,FsunH,FshdH, FsunL,FshdL,Rabsb_sno,Rabsb_bare,Rabsb_urb,Rabsb_wat,Rabsb_rock,Rabsb_ice,Rabsb_deb, e_sno,e_gr,e_sur,Cicew,Csnow,CLitter, dw_L,dw_H,dw_SNO, In_H,In_L,In_urb,In_rock,SWE,In_SWE, Pr_liq,Pr_sno,rs_sunH,rs_sunL,rs_shdH,rs_shdL,d_leaf_H,d_leaf_L,r_litter,r_soil,b_soil,alp_soil, ms,dz,Zs,rsd,lan_dry,lan_s,cv_s,SPAR,L,Pe,O33,alpVG,nVG,Phy,s_SVG,bVG,Osat,Ohy,Oicetm1,Otm1, Tstm1,Tdamptm1,Tdptm1,CTt,CTt_oth,OPT_FR_SOIL,OPT_STh, zatm,disp_h,zom,zoh,zom_under,disp_h_H,zom_H,disp_h_L,zom_L,Ws,In_Litter,alp_litter,Lpho,Vavail,Vavail_plant_H,Vavail_plant_L,WAT_avail,ICEtm1,OPT_SoilTemp)
% Wrapper for logging I/O to tc.Surface_Temperature
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Surface_Temperature', inputs);

    [DQ] = tc.Surface_Temperature(Ts,dt,Ta,ea,Latm,SvF,Pre, Csno,Crock,Curb,Cbare,Ccrown,Cwat,Cice, hc_H,hc_L,SnoDep,ydepth,ICE_D,Cdeb,LAI_H,LAI_L,SAI_H,SAI_L, RabsbSun_vegH,RabsbShd_vegH,Rabsb_soiH, RabsbSun_vegL,RabsbShd_vegL,Rabsb_soiL,FsunH,FshdH, FsunL,FshdL,Rabsb_sno,Rabsb_bare,Rabsb_urb,Rabsb_wat,Rabsb_rock,Rabsb_ice,Rabsb_deb, e_sno,e_gr,e_sur,Cicew,Csnow,CLitter, dw_L,dw_H,dw_SNO, In_H,In_L,In_urb,In_rock,SWE,In_SWE, Pr_liq,Pr_sno,rs_sunH,rs_sunL,rs_shdH,rs_shdL,d_leaf_H,d_leaf_L,r_litter,r_soil,b_soil,alp_soil, ms,dz,Zs,rsd,lan_dry,lan_s,cv_s,SPAR,L,Pe,O33,alpVG,nVG,Phy,s_SVG,bVG,Osat,Ohy,Oicetm1,Otm1, Tstm1,Tdamptm1,Tdptm1,CTt,CTt_oth,OPT_FR_SOIL,OPT_STh, zatm,disp_h,zom,zoh,zom_under,disp_h_H,zom_H,disp_h_L,zom_L,Ws,In_Litter,alp_litter,Lpho,Vavail,Vavail_plant_H,Vavail_plant_L,WAT_avail,ICEtm1,OPT_SoilTemp);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Surface_Temperature', outputs);
end
