function [LAI,B,NPP,ANPP,Rg,RA,Rms,Rmr,Rmc,PHE_S,dflo,AgeL,e_rel,e_relN,LAIdead,NBLeaf,Sr,Slf,Sfr,Swm,Sll, Rexmy,Rootl,AgeDL,Bfac_day,Bfac_week,NPPm,Tsmm,NupIm,PAR_Im,NBL_Im,RB,FNC,Nreserve,Preserve,Kreserve,rNc,rPc,rKc,ManI] = VEGGIE_UNIT(Btm1,PHE_Stm1,dflotm1,AgeLtm1,AgeDLtm1, Ta,Tdp,PAR,Psi_x,Psi_l,An,Rdark,NPPtm1,jDay,Datam,NPPI,TdpI,Bfac_weekI,NupI,NavlI,PAR_I,NBL_I,NBLeaftm1, L_day,Lmax_day,Veg_Param_Dyn,cc, Nreservetm1,Preservetm1,Kreservetm1,Nuptake,Puptake,Kuptake,FNCtm1,Se_bio,Tdp_bio, ParEx,EM,Bam,Bem,Mpar,TBio,OPT_EnvLimitGrowth,OPT_VCA,OPT_VD,OPT_SoilBiogeochemistry)
% Wrapper for logging I/O to tc.VEGGIE_UNIT
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'VEGGIE_UNIT', inputs);

    [LAI,B,NPP,ANPP,Rg,RA,Rms,Rmr,Rmc,PHE_S,dflo,AgeL,e_rel,e_relN,LAIdead,NBLeaf,Sr,Slf,Sfr,Swm,Sll, Rexmy,Rootl,AgeDL,Bfac_day,Bfac_week,NPPm,Tsmm,NupIm,PAR_Im,NBL_Im,RB,FNC,Nreserve,Preserve,Kreserve,rNc,rPc,rKc,ManI] = tc.VEGGIE_UNIT(Btm1,PHE_Stm1,dflotm1,AgeLtm1,AgeDLtm1, Ta,Tdp,PAR,Psi_x,Psi_l,An,Rdark,NPPtm1,jDay,Datam,NPPI,TdpI,Bfac_weekI,NupI,NavlI,PAR_I,NBL_I,NBLeaftm1, L_day,Lmax_day,Veg_Param_Dyn,cc, Nreservetm1,Preservetm1,Kreservetm1,Nuptake,Puptake,Kuptake,FNCtm1,Se_bio,Tdp_bio, ParEx,EM,Bam,Bem,Mpar,TBio,OPT_EnvLimitGrowth,OPT_VCA,OPT_VD,OPT_SoilBiogeochemistry);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'VEGGIE_UNIT', outputs);
end
