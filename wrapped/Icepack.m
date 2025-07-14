function [TsF,ICE,ICE_D,IP_wc,WR_IP,dQ,Qfm,Im] = Icepack(dt,Ts,Tstm1,ICEtm1,IP_wctm1, Pr_liq,EICE,Rn,H,QE,G,Qv,Cwat,Ccrown,Cfol_H,Csno,Cicew,Ice_wc_sp,WR_SP)
% Wrapper for logging I/O to tc.Icepack
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Icepack', inputs);

    [TsF,ICE,ICE_D,IP_wc,WR_IP,dQ,Qfm,Im] = tc.Icepack(dt,Ts,Tstm1,ICEtm1,IP_wctm1, Pr_liq,EICE,Rn,H,QE,G,Qv,Cwat,Ccrown,Cfol_H,Csno,Cicew,Ice_wc_sp,WR_SP);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Icepack', outputs);
end
