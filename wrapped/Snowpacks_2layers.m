function [TsF,Tdpsnow,SWE,D,ros,In_SWE,SP_wc,WR_SP,U_SWE,NIn_SWE,dQ12,Qfm,t_sls,Sm,dQres,dTsnow] = Snowpacks_2layers(dt, Ta,Ts,Tstm1,Tdpsnowtm1,Tdew,Ws,t_slstm1,SWEtm1,Dtm1,rostm1,SP_wctm1,In_SWEtm1,In_max_SWE,dw_SNO, Pr_liq,Pr_sno,ESN,ESN_In,Rn,H,QE,G,Qv,Csnow,Ccrown,Cwat,Cfol_H,fpr,Pr_sno_day,Th_Pr_sno,ros_max1,ros_max2,lan_sno,min_SPD)
% Wrapper for logging I/O to tc.Snowpacks_2layers
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Snowpacks_2layers', inputs);

    [TsF,Tdpsnow,SWE,D,ros,In_SWE,SP_wc,WR_SP,U_SWE,NIn_SWE,dQ12,Qfm,t_sls,Sm,dQres,dTsnow] = tc.Snowpacks_2layers(dt, Ta,Ts,Tstm1,Tdpsnowtm1,Tdew,Ws,t_slstm1,SWEtm1,Dtm1,rostm1,SP_wctm1,In_SWEtm1,In_max_SWE,dw_SNO, Pr_liq,Pr_sno,ESN,ESN_In,Rn,H,QE,G,Qv,Csnow,Ccrown,Cwat,Cfol_H,fpr,Pr_sno_day,Th_Pr_sno,ros_max1,ros_max2,lan_sno,min_SPD);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Snowpacks_2layers', outputs);
end
