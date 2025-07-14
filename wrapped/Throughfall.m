function [Cfol_H,Cfol_L,CLitter] = Throughfall(LAI_H,SAI_H,LAI_L,SAI_L,Llitter,Kc)
% Wrapper for logging I/O to tc.Throughfall
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Throughfall', inputs);

    [Cfol_H,Cfol_L,CLitter] = tc.Throughfall(LAI_H,SAI_H,LAI_L,SAI_L,Llitter,Kc);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Throughfall', outputs);
end
