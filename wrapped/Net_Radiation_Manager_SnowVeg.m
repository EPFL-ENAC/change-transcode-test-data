function [Rnet] = Net_Radiation_Manager_SnowVeg(Ts,TsV,Latm,SvF, Csno,Crock,Curb,Cwat,Cbare,Cice,Ccrown, hc_L,SnoDep,ydepth,ICE_D,LAI_H,LAI_L,SAI_H,SAI_L, RabsbSun_vegH,RabsbShd_vegH,Rabsb_soiH, RabsbSun_vegL,RabsbShd_vegL,Rabsb_soiL,FsunH,FshdH, FsunL,FshdL,Rabsb_sno,Rabsb_bare,Rabsb_urb,Rabsb_wat,Rabsb_rock,Rabsb_ice, e_sno,e_gr,e_sur,Cicew,Csnow)
% Wrapper for logging I/O to tc.Net_Radiation_Manager_SnowVeg
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Net_Radiation_Manager_SnowVeg', inputs);

    [Rnet] = tc.Net_Radiation_Manager_SnowVeg(Ts,TsV,Latm,SvF, Csno,Crock,Curb,Cwat,Cbare,Cice,Ccrown, hc_L,SnoDep,ydepth,ICE_D,LAI_H,LAI_L,SAI_H,SAI_L, RabsbSun_vegH,RabsbShd_vegH,Rabsb_soiH, RabsbSun_vegL,RabsbShd_vegL,Rabsb_soiL,FsunH,FshdH, FsunL,FshdL,Rabsb_sno,Rabsb_bare,Rabsb_urb,Rabsb_wat,Rabsb_rock,Rabsb_ice, e_sno,e_gr,e_sur,Cicew,Csnow);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Net_Radiation_Manager_SnowVeg', outputs);
end
