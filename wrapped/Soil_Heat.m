function [G,Tdp] = Soil_Heat(dt,Ts,Tstm1,Tdptm1,CTt)
% Wrapper for logging I/O to tc.Soil_Heat
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Soil_Heat', inputs);

    [G,Tdp] = tc.Soil_Heat(dt,Ts,Tstm1,Tdptm1,CTt);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Soil_Heat', outputs);
end
