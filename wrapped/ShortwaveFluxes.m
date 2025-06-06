function [RabsbSun_vegH,RabsbShd_vegH,Rabsb_soiH,PAR_sun_H,PAR_shd_H, RabsbSun_vegL,RabsbShd_vegL,Rabsb_soiL,PAR_sun_L,PAR_shd_L,FsunH,FshdH, FsunL,FshdL,Kopt_H,Kopt_L,fapar_H,fapar_L,NDVI,ALB,Rabsb_sno,Rabsb_bare,Rabsb_urb,Rabsb_wat,Rabsb_rock,Rabsb_ice,Rabsb_deb, soil_alb,e_gr,e_sur] = ShortwaveFluxes(Ccrown,Cbare,Crock,Curb,Cwat,Csno,Cice, Rsw,PAR,SvF,dw_SNO,hc_H,hc_L,SnoDep,ydepth,IceDep,Cdeb,Deb_Par,Urb_Par,h_S,snow_alb,Aice,OS,Color_Class,OM_H,OM_L, LAI_H,SAI_H,LAId_H,LAI_L,SAI_L,LAId_L,PFT_opt_H,PFT_opt_L)
% Wrapper for logging I/O to tc.ShortwaveFluxes
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('ShortwaveFluxes', inputs);

    [RabsbSun_vegH,RabsbShd_vegH,Rabsb_soiH,PAR_sun_H,PAR_shd_H, RabsbSun_vegL,RabsbShd_vegL,Rabsb_soiL,PAR_sun_L,PAR_shd_L,FsunH,FshdH, FsunL,FshdL,Kopt_H,Kopt_L,fapar_H,fapar_L,NDVI,ALB,Rabsb_sno,Rabsb_bare,Rabsb_urb,Rabsb_wat,Rabsb_rock,Rabsb_ice,Rabsb_deb, soil_alb,e_gr,e_sur] = tc.ShortwaveFluxes(Ccrown,Cbare,Crock,Curb,Cwat,Csno,Cice, Rsw,PAR,SvF,dw_SNO,hc_H,hc_L,SnoDep,ydepth,IceDep,Cdeb,Deb_Par,Urb_Par,h_S,snow_alb,Aice,OS,Color_Class,OM_H,OM_L, LAI_H,SAI_H,LAId_H,LAI_L,SAI_L,LAId_L,PFT_opt_H,PFT_opt_L);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('ShortwaveFluxes', outputs);
end
