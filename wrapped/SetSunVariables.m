function  [h_S,delta_S,zeta_S,T_sunrise,T_sunset,L_day]  = SetSunVariables(Datam,DeltaGMT,Lon,Lat,t_bef,t_aft)
% Wrapper for logging I/O to tc.SetSunVariables
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('SetSunVariables', inputs);

     [h_S,delta_S,zeta_S,T_sunrise,T_sunset,L_day]  = tc.SetSunVariables(Datam,DeltaGMT,Lon,Lat,t_bef,t_aft);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('SetSunVariables', outputs);
end
