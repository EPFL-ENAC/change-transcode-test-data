function  [dT] = SOIL_THERMAL_COND_MOD(t,T,lan,cv,dz,nz,Dz,G0,Gn,Tup,Tdown,opt)
% Wrapper for logging I/O to tc.SOIL_THERMAL_COND_MOD
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'SOIL_THERMAL_COND_MOD', inputs);

     [dT] = tc.SOIL_THERMAL_COND_MOD(t,T,lan,cv,dz,nz,Dz,G0,Gn,Tup,Tdown,opt);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'SOIL_THERMAL_COND_MOD', outputs);
end
