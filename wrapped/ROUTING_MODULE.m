function [q_runon,q_channel_out,Qi_in,Slo_pot,Q_exit,Qsub_exit,T_pot, QpointH,QpointC,UpointH,UpointC,Q_ch_added,Utot_H,Utot_C] = ROUTING_MODULE(dt,dth,Rd,Rh,Qi_out,q_channel_in, cellsize,Area,DTM,NMAN_H,NMAN_C,MRough,WC,SN,T_flow,T_potI,Slo_top,ms_max,POT,ZWT,OPT_HEAD,Xout,Yout)
% Wrapper for logging I/O to tc.ROUTING_MODULE
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('ROUTING_MODULE', inputs);

    [q_runon,q_channel_out,Qi_in,Slo_pot,Q_exit,Qsub_exit,T_pot, QpointH,QpointC,UpointH,UpointC,Q_ch_added,Utot_H,Utot_C] = tc.ROUTING_MODULE(dt,dth,Rd,Rh,Qi_out,q_channel_in, cellsize,Area,DTM,NMAN_H,NMAN_C,MRough,WC,SN,T_flow,T_potI,Slo_top,ms_max,POT,ZWT,OPT_HEAD,Xout,Yout);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('ROUTING_MODULE', outputs);
end
