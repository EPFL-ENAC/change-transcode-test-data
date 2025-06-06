function [Rnet] = Net_Radiation_Manager_VegSnow(Ts,Ts2,Latm,SvF, Csno,Ccrown, hc_L,SnoDep,LAI_H,LAI_L,SAI_H,SAI_L, RabsbSun_vegH,RabsbShd_vegH,FsunH,FshdH, FsunL,FshdL, e_sno,e_gr)
% Wrapper for logging I/O to tc.Net_Radiation_Manager_VegSnow
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Net_Radiation_Manager_VegSnow', inputs);

    [Rnet] = tc.Net_Radiation_Manager_VegSnow(Ts,Ts2,Latm,SvF, Csno,Ccrown, hc_L,SnoDep,LAI_H,LAI_L,SAI_H,SAI_L, RabsbSun_vegH,RabsbShd_vegH,FsunH,FshdH, FsunL,FshdL, e_sno,e_gr);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Net_Radiation_Manager_VegSnow', outputs);
end
