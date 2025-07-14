function [dB] = VEGETATION_DYNAMIC(t,B,Tam,Tsm,An,Rdark,Bfac,Bfac_alloc,FNC,Se_bio,Tdp_bio,dtd,GF, Sl,mSl,Sl_emecrop,St,r,rNc,gR,aSE,Trr,dd_max,dc_C,Tcold,drn,dsn,age_cr,PHE_S,AgeL,AgeDL,LtR,eps_ac, Mf,Wm,fab,fbe,Klf,ff_r,dmg,Rexmy,NBLeaf,dflo,Nreserve,Preserve,Kreserve,soCrop,TBio,GirdOpt,OPT_EnvLimitGrowth,OPT_VCA)
% Wrapper for logging I/O to tc.VEGETATION_DYNAMIC
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'VEGETATION_DYNAMIC', inputs);

    [dB] = tc.VEGETATION_DYNAMIC(t,B,Tam,Tsm,An,Rdark,Bfac,Bfac_alloc,FNC,Se_bio,Tdp_bio,dtd,GF, Sl,mSl,Sl_emecrop,St,r,rNc,gR,aSE,Trr,dd_max,dc_C,Tcold,drn,dsn,age_cr,PHE_S,AgeL,AgeDL,LtR,eps_ac, Mf,Wm,fab,fbe,Klf,ff_r,dmg,Rexmy,NBLeaf,dflo,Nreserve,Preserve,Kreserve,soCrop,TBio,GirdOpt,OPT_EnvLimitGrowth,OPT_VCA);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'VEGETATION_DYNAMIC', outputs);
end
