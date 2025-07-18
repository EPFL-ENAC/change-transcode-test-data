function [B,RBi] = Fruit_Harvest(B,dtd,jDay,jDay_harv,B_harv)
% Wrapper for logging I/O to tc.Fruit_Harvest
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Fruit_Harvest', inputs);

    [B,RBi] = tc.Fruit_Harvest(B,dtd,jDay,jDay_harv,B_harv);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Fruit_Harvest', outputs);
end
