function [ICE,ICE_D,SWE,SND,SP_wc,WAT,NIce] = Snow2Ice(dt,Ts,ICEtm1,SWEtm1,SNDtm1,SP_wctm1,WATtm1,Cicew,ros,ros_Ice_thr,Cwat,Cicewtm1,dz_ice,WatFreez_Th)
% Wrapper for logging I/O to tc.Snow2Ice
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Snow2Ice', inputs);

    [ICE,ICE_D,SWE,SND,SP_wc,WAT,NIce] = tc.Snow2Ice(dt,Ts,ICEtm1,SWEtm1,SNDtm1,SP_wctm1,WATtm1,Cicew,ros,ros_Ice_thr,Cwat,Cicewtm1,dz_ice,WatFreez_Th);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Snow2Ice', outputs);
end
