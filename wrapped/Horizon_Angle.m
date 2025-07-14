function  [HZ,Z]  = Horizon_Angle(DTM,cellsize)
% Wrapper for logging I/O to tc.Horizon_Angle
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Horizon_Angle', inputs);

     [HZ,Z]  = tc.Horizon_Angle(DTM,cellsize);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Horizon_Angle', outputs);
end
