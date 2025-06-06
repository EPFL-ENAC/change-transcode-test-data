function [Rnet] = Net_Radiation_Manager(Ts,Latm,SvF, Csno,Crock,Curb,Cwat,Cbare,Cice,Ccrown, hc_L,SnoDep,ydepth,ICE_D,Cdeb,LAI_H,LAI_L,SAI_H,SAI_L, RabsbSun_vegH,RabsbShd_vegH,Rabsb_soiH, RabsbSun_vegL,RabsbShd_vegL,Rabsb_soiL,FsunH,FshdH, FsunL,FshdL,Rabsb_sno,Rabsb_bare,Rabsb_urb,Rabsb_wat,Rabsb_rock,Rabsb_ice,Rabsb_deb, e_sno,e_gr,e_sur,Cicew,Csnow)
% Wrapper for logging I/O to tc.Net_Radiation_Manager
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Net_Radiation_Manager', inputs);

    [Rnet] = tc.Net_Radiation_Manager(Ts,Latm,SvF, Csno,Crock,Curb,Cwat,Cbare,Cice,Ccrown, hc_L,SnoDep,ydepth,ICE_D,Cdeb,LAI_H,LAI_L,SAI_H,SAI_L, RabsbSun_vegH,RabsbShd_vegH,Rabsb_soiH, RabsbSun_vegL,RabsbShd_vegL,Rabsb_soiL,FsunH,FshdH, FsunL,FshdL,Rabsb_sno,Rabsb_bare,Rabsb_urb,Rabsb_wat,Rabsb_rock,Rabsb_ice,Rabsb_deb, e_sno,e_gr,e_sur,Cicew,Csnow);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Net_Radiation_Manager', outputs);
end
