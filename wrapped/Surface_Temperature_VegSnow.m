function [DQ] = Surface_Temperature_VegSnow(Ts,Ts2,dt,Ta,ea,Latm,SvF,Pre, Csno,Ccrown, hc_H,hc_L,SnoDep,LAI_H,LAI_L,SAI_H,SAI_L, RabsbSun_vegH,RabsbShd_vegH,FsunH,FshdH, FsunL,FshdL,e_sno,e_gr, dw_H,dw_SNO,In_H, rs_sunH,rs_shdH,d_leaf_H,d_leaf_L, zatm,disp_h,zom,zoh,zom_under,disp_h_H,zom_H,disp_h_L,zom_L,Ws,Lpho,Vavail_plant_H)
% Wrapper for logging I/O to tc.Surface_Temperature_VegSnow
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Surface_Temperature_VegSnow', inputs);

    [DQ] = tc.Surface_Temperature_VegSnow(Ts,Ts2,dt,Ta,ea,Latm,SvF,Pre, Csno,Ccrown, hc_H,hc_L,SnoDep,LAI_H,LAI_L,SAI_H,SAI_L, RabsbSun_vegH,RabsbShd_vegH,FsunH,FshdH, FsunL,FshdL,e_sno,e_gr, dw_H,dw_SNO,In_H, rs_sunH,rs_shdH,d_leaf_H,d_leaf_L, zatm,disp_h,zom,zoh,zom_under,disp_h_H,zom_H,disp_h_L,zom_L,Ws,Lpho,Vavail_plant_H);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Surface_Temperature_VegSnow', outputs);
end
