function [SND,SWE,ros,S_exit] = AVALANCHES(DTM,cellsize,Area,Asur,Slo_top,SND,SWE,ros)
% Wrapper for logging I/O to tc.AVALANCHES
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('AVALANCHES', inputs);

    [SND,SWE,ros,S_exit] = tc.AVALANCHES(DTM,cellsize,Area,Asur,Slo_top,SND,SWE,ros);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('AVALANCHES', outputs);
end
