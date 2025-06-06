function  [SLO,ASP] = Slope_Aspect_indexes(DTM,cellsize,ANSW)
% Wrapper for logging I/O to tc.Slope_Aspect_indexes
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Slope_Aspect_indexes', inputs);

     [SLO,ASP] = tc.Slope_Aspect_indexes(DTM,cellsize,ANSW);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Slope_Aspect_indexes', outputs);
end
