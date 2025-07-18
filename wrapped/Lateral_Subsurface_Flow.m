function [Qi_out] = Lateral_Subsurface_Flow(Koh,dz,Slo_pot,aT,cosalp,sinalp,SN,I1)
% Wrapper for logging I/O to tc.Lateral_Subsurface_Flow
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Lateral_Subsurface_Flow', inputs);

    [Qi_out] = tc.Lateral_Subsurface_Flow(Koh,dz,Slo_pot,aT,cosalp,sinalp,SN,I1);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Lateral_Subsurface_Flow', outputs);
end
