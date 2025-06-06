function  [HZ,Z]  = Horizon_angle_polar(DTM,cellsize,dmax)
% Wrapper for logging I/O to tc.Horizon_angle_polar
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Horizon_angle_polar', inputs);

     [HZ,Z]  = tc.Horizon_angle_polar(DTM,cellsize,dmax);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Horizon_angle_polar', outputs);
end
