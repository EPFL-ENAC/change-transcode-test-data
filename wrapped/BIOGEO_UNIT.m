function [P,LEAK_NH4,LEAK_NO3,LEAK_P,LEAK_K,LEAK_DOC,LEAK_DON,LEAK_DOP,R_NH4,R_NO3,R_P,R_K,R_DOC,R_DON,R_DOP,Nuptake_H,Puptake_H,Kuptake_H,Nuptake_L,Puptake_L,Kuptake_L,RexmyI, R_litter,R_microbe,R_litter_sur,R_ew,VOL,N2flx,Min_N,Min_P,R_bacteria,RmycAM,RmycEM,Prod_B,Prod_F,BfixN,NavlI,LitFirEmi] = BIOGEO_UNIT(Ptm1,IS,ZBIOG,rsd,PH,Ts,Ta,Psi_s,Se,Se_fc,V,VT,Ccrown,Bio_Zs,RfH_Zs,RfL_Zs, Lk,Rd,Rh,Pr,T_H,T_L,Broot_H,Broot_L,LAI_H,LAI_L, SupN_H,SupP_H,SupK_H,SupN_L,SupP_L,SupK_L,Rexmy,RexmyI,ExEM,NavlI,Pcla,Psan, B_IO,jDay,FireA,AAET)
% Wrapper for logging I/O to tc.BIOGEO_UNIT
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('BIOGEO_UNIT', inputs);

    [P,LEAK_NH4,LEAK_NO3,LEAK_P,LEAK_K,LEAK_DOC,LEAK_DON,LEAK_DOP,R_NH4,R_NO3,R_P,R_K,R_DOC,R_DON,R_DOP,Nuptake_H,Puptake_H,Kuptake_H,Nuptake_L,Puptake_L,Kuptake_L,RexmyI, R_litter,R_microbe,R_litter_sur,R_ew,VOL,N2flx,Min_N,Min_P,R_bacteria,RmycAM,RmycEM,Prod_B,Prod_F,BfixN,NavlI,LitFirEmi] = tc.BIOGEO_UNIT(Ptm1,IS,ZBIOG,rsd,PH,Ts,Ta,Psi_s,Se,Se_fc,V,VT,Ccrown,Bio_Zs,RfH_Zs,RfL_Zs, Lk,Rd,Rh,Pr,T_H,T_L,Broot_H,Broot_L,LAI_H,LAI_L, SupN_H,SupP_H,SupK_H,SupN_L,SupP_L,SupK_L,Rexmy,RexmyI,ExEM,NavlI,Pcla,Psan, B_IO,jDay,FireA,AAET);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('BIOGEO_UNIT', outputs);
end
