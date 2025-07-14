function [PHE_S,dflo,AgeL,AgeDL] = PHENOLOGY_STATE(NLeaf,AgeLtm1,dtd, LAIdead,NLeafdead,AgeDLtm1, PHE_Stm1,LAI,aSE,age_cr,jDay,Tsmm,Bfac_day,Bfac_week,NPPm,PAR_Im,L_day,Bfac_lo,Bfac_ls,Tlo,Tls,mjDay,LDay_min,LDay_cr,dflotm1,dmg,PAR_th,LAI_min,jDay_dist,LAI_cut)
% Wrapper for logging I/O to tc.PHENOLOGY_STATE
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'PHENOLOGY_STATE', inputs);

    [PHE_S,dflo,AgeL,AgeDL] = tc.PHENOLOGY_STATE(NLeaf,AgeLtm1,dtd, LAIdead,NLeafdead,AgeDLtm1, PHE_Stm1,LAI,aSE,age_cr,jDay,Tsmm,Bfac_day,Bfac_week,NPPm,PAR_Im,L_day,Bfac_lo,Bfac_ls,Tlo,Tls,mjDay,LDay_min,LDay_cr,dflotm1,dmg,PAR_th,LAI_min,jDay_dist,LAI_cut);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'PHENOLOGY_STATE', outputs);
end
