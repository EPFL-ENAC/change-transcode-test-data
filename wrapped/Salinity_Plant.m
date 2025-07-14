function [Psi_s] = Salinity_Plant(Salt,Tdp,Tl,Psi_s,Psi_sto_00,Psi_sto_50,Osm_reg_Max,eps_root_base)
% Wrapper for logging I/O to tc.Salinity_Plant
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Salinity_Plant', inputs);

    [Psi_s] = tc.Salinity_Plant(Salt,Tdp,Tl,Psi_s,Psi_sto_00,Psi_sto_50,Osm_reg_Max,eps_root_base);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Salinity_Plant', outputs);
end
