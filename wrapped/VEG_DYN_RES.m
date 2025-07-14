function [LAI,NPP,Rg,RA,Rms,Rmr,Rmc,ANPP,LAIdead,Sr,Slf,Sfr,Swm,Sll,NLeaf,NLeafdead,NBLeaf,Nreserve,Preserve,Kreserve] = VEG_DYN_RES(B,dtd,Btm1,Tam,Tsm,An,Rdark, Sl,mSl,Sl_emecrop,St,r,gR,aSE,AgeL,AgeDL,age_cr,dc_C,Tcold,Bfac,GF,dd_max,PHE_S,dsn,drn,fab,fbe,Wm,Mf,Klf,NBLeaftm1,dmg,Nreservetm1,Preservetm1,Kreservetm1, Nuptake,Puptake,Kuptake,rNcR,rNc,rPc,rKc,OPT_EnvLimitGrowth)
% Wrapper for logging I/O to tc.VEG_DYN_RES
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'VEG_DYN_RES', inputs);

    [LAI,NPP,Rg,RA,Rms,Rmr,Rmc,ANPP,LAIdead,Sr,Slf,Sfr,Swm,Sll,NLeaf,NLeafdead,NBLeaf,Nreserve,Preserve,Kreserve] = tc.VEG_DYN_RES(B,dtd,Btm1,Tam,Tsm,An,Rdark, Sl,mSl,Sl_emecrop,St,r,gR,aSE,AgeL,AgeDL,age_cr,dc_C,Tcold,Bfac,GF,dd_max,PHE_S,dsn,drn,fab,fbe,Wm,Mf,Klf,NBLeaftm1,dmg,Nreservetm1,Preservetm1,Kreservetm1, Nuptake,Puptake,Kuptake,rNcR,rNc,rPc,rKc,OPT_EnvLimitGrowth);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'VEG_DYN_RES', outputs);
end
