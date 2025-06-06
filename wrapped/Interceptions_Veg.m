function [In_H,In_L,In_Litter,Dr_H,Dr_L,WIS] = Interceptions_Veg(dt, Ccrown,Cfol_H,Cfol_L,CLitter,Cbare,Csno,Cice,Crock,Curb,Cwat,dw_SNO,In_Ltm1,In_Htm1,In_Littertm1, In_max_H,In_max_L,BLit, Pr_liq,EIn_H,EIn_L,Elitter,q_runon,WR_SP,WR_IP,gc,Kc)
% Wrapper for logging I/O to tc.Interceptions_Veg
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Interceptions_Veg', inputs);

    [In_H,In_L,In_Litter,Dr_H,Dr_L,WIS] = tc.Interceptions_Veg(dt, Ccrown,Cfol_H,Cfol_L,CLitter,Cbare,Csno,Cice,Crock,Curb,Cwat,dw_SNO,In_Ltm1,In_Htm1,In_Littertm1, In_max_H,In_max_L,BLit, Pr_liq,EIn_H,EIn_L,Elitter,q_runon,WR_SP,WR_IP,gc,Kc);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Interceptions_Veg', outputs);
end
