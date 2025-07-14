function [DQ] = Surface_Temperature_Debris(Ts,dt,Ta,ea,Latm,SvF,Pre, Csno,Crock,Curb,Cbare,Ccrown,Cwat,Cice, hc_H,hc_L,SnoDep,ydepth,ICE_D,Cdeb,Zs_deb,LAI_H,LAI_L,SAI_H,SAI_L, RabsbSun_vegH,RabsbShd_vegH,Rabsb_soiH, RabsbSun_vegL,RabsbShd_vegL,Rabsb_soiL,FsunH,FshdH, FsunL,FshdL,Rabsb_sno,Rabsb_bare,Rabsb_urb,Rabsb_wat,Rabsb_rock,Rabsb_ice,Rabsb_deb, e_sno,e_gr,e_sur,Cicew,Csnow,CLitter, dw_L,dw_H,dw_SNO, In_H,In_L,In_urb,In_rock,SWE,In_SWE, Pr_liq,Pr_sno,rs_sunH,rs_sunL,rs_shdH,rs_shdL,d_leaf_H,d_leaf_L,r_litter,r_soil,b_soil,alp_soil, Tdebtm1,Ticetm1,Deb_Par,ms_deb, zatm,disp_h,zom,zoh,zom_under,disp_h_H,zom_H,disp_h_L,zom_L,Ws,In_Litter,alp_litter,Vavail,Vavail_plant_H,Vavail_plant_L,WAT_avail,ICEtm1)
% Wrapper for logging I/O to tc.Surface_Temperature_Debris
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Surface_Temperature_Debris', inputs);

    [DQ] = tc.Surface_Temperature_Debris(Ts,dt,Ta,ea,Latm,SvF,Pre, Csno,Crock,Curb,Cbare,Ccrown,Cwat,Cice, hc_H,hc_L,SnoDep,ydepth,ICE_D,Cdeb,Zs_deb,LAI_H,LAI_L,SAI_H,SAI_L, RabsbSun_vegH,RabsbShd_vegH,Rabsb_soiH, RabsbSun_vegL,RabsbShd_vegL,Rabsb_soiL,FsunH,FshdH, FsunL,FshdL,Rabsb_sno,Rabsb_bare,Rabsb_urb,Rabsb_wat,Rabsb_rock,Rabsb_ice,Rabsb_deb, e_sno,e_gr,e_sur,Cicew,Csnow,CLitter, dw_L,dw_H,dw_SNO, In_H,In_L,In_urb,In_rock,SWE,In_SWE, Pr_liq,Pr_sno,rs_sunH,rs_sunL,rs_shdH,rs_shdL,d_leaf_H,d_leaf_L,r_litter,r_soil,b_soil,alp_soil, Tdebtm1,Ticetm1,Deb_Par,ms_deb, zatm,disp_h,zom,zoh,zom_under,disp_h_H,zom_H,disp_h_L,zom_L,Ws,In_Litter,alp_litter,Vavail,Vavail_plant_H,Vavail_plant_L,WAT_avail,ICEtm1);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Surface_Temperature_Debris', outputs);
end
