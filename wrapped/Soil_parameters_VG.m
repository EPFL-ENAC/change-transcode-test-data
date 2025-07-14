function [s_S,b] = Soil_parameters_VG(Phy1,Osat,Ohy,nVG,alpVG,GRAPH)
% Wrapper for logging I/O to tc.Soil_parameters_VG
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Soil_parameters_VG', inputs);

    [s_S,b] = tc.Soil_parameters_VG(Phy1,Osat,Ohy,nVG,alpVG,GRAPH);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Soil_parameters_VG', outputs);
end
