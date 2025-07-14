function  [V,O,Rd]  = Cryosuction_stabilizer(Oice,V,dz,Osat,Ohy)
% Wrapper for logging I/O to tc.Cryosuction_stabilizer
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Cryosuction_stabilizer', inputs);

     [V,O,Rd]  = tc.Cryosuction_stabilizer(Oice,V,dz,Osat,Ohy);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Cryosuction_stabilizer', outputs);
end
