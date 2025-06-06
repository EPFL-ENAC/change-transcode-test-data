function [dB,R_litter,R_microbe,R_litter_sur,R_ew,VOL,N2flx,Min_N,Min_P,R_bacteria,RmycAM,RmycEM,Prod_B,Prod_F] = BIOGEOCHEMISTRY_DYNAMIC3(t,B,ZBIOG,rsd, ISOIL,Ts,Ta,Psi_s,PH,Se,Se_fc, FertN,DepN,BfixN,FertP,DepP,FertK,DepK, NH4_Uptake,NO3_Uptake,P_Uptake,K_Uptake,LEAK_DOC,LEAK_NH4,LEAK_NO3,LEAK_P,LEAK_K,LEAK_DON,LEAK_DOP,Tup_P,Tup_K,ExEM,Pcla,Psan,BiogeoPar,SC_par,IMAN,opt_cons_CUE)
% Wrapper for logging I/O to tc.BIOGEOCHEMISTRY_DYNAMIC3
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('BIOGEOCHEMISTRY_DYNAMIC3', inputs);

    [dB,R_litter,R_microbe,R_litter_sur,R_ew,VOL,N2flx,Min_N,Min_P,R_bacteria,RmycAM,RmycEM,Prod_B,Prod_F] = tc.BIOGEOCHEMISTRY_DYNAMIC3(t,B,ZBIOG,rsd, ISOIL,Ts,Ta,Psi_s,PH,Se,Se_fc, FertN,DepN,BfixN,FertP,DepP,FertK,DepK, NH4_Uptake,NO3_Uptake,P_Uptake,K_Uptake,LEAK_DOC,LEAK_NH4,LEAK_NO3,LEAK_P,LEAK_K,LEAK_DON,LEAK_DOP,Tup_P,Tup_K,ExEM,Pcla,Psan,BiogeoPar,SC_par,IMAN,opt_cons_CUE);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('BIOGEOCHEMISTRY_DYNAMIC3', outputs);
end
