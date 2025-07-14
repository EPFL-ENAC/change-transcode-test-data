function [WAT_out,Q_channel_out,q_runon_out,Q_out_Res,H_Res,VOL_Res] = RESERVOIRS(DTM,cellsize,t,dth,dt,SN,WAT,Q_channel,q_runon, RES_ID_List,RES_ID,RES_Outlet,Res_prop,Res_TS)
% Wrapper for logging I/O to tc.RESERVOIRS
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'RESERVOIRS', inputs);

    [WAT_out,Q_channel_out,q_runon_out,Q_out_Res,H_Res,VOL_Res] = tc.RESERVOIRS(DTM,cellsize,t,dth,dt,SN,WAT,Q_channel,q_runon, RES_ID_List,RES_ID,RES_Outlet,Res_prop,Res_TS);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'RESERVOIRS', outputs);
end
