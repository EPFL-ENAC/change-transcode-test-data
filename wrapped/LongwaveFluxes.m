function [Labs_vegH,Labs_vegL,Labs_soi] = LongwaveFluxes(Tg,TvHsun,TvHshd,TvLsun,TvLshd,Tsno, Latm,SvF,e_gr,LAI_H,SAI_H,LAI_L,SAI_L,FshdH,FsunH,FshdL,FsunL,hc_L,SnoDep,e_sno,Csno)
% Wrapper for logging I/O to tc.LongwaveFluxes
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('LongwaveFluxes', inputs);

    [Labs_vegH,Labs_vegL,Labs_soi] = tc.LongwaveFluxes(Tg,TvHsun,TvHshd,TvLsun,TvLshd,Tsno, Latm,SvF,e_gr,LAI_H,SAI_H,LAI_L,SAI_L,FshdH,FsunH,FshdL,FsunL,hc_L,SnoDep,e_sno,Csno);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('LongwaveFluxes', outputs);
end
