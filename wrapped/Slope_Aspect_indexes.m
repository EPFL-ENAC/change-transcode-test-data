function  [SLO,ASP] = Slope_Aspect_indexes(DTM,cellsize,ANSW)
% Wrapper for logging I/O to tc.Slope_Aspect_indexes
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Slope_Aspect_indexes', inputs);

     [SLO,ASP] = tc.Slope_Aspect_indexes(DTM,cellsize,ANSW);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Slope_Aspect_indexes', outputs);
end
