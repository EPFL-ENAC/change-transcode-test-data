function [Tdp_H,Tdp_L] = RootZone_Temp(Tdp,RfH_Zs,RfL_Zs)
% Wrapper for logging I/O to tc.RootZone_Temp
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'RootZone_Temp', inputs);

    [Tdp_H,Tdp_L] = tc.RootZone_Temp(Tdp,RfH_Zs,RfL_Zs);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'RootZone_Temp', outputs);
end
