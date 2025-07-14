function [KsC,LC,OsatC,OhyC,PeC,E] = SoilCrust(dth,ke,Etm1,rsd,Osat,Ohy,L,Pe,Ks)
% Wrapper for logging I/O to tc.SoilCrust
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'SoilCrust', inputs);

    [KsC,LC,OsatC,OhyC,PeC,E] = tc.SoilCrust(dth,ke,Etm1,rsd,Osat,Ohy,L,Pe,Ks);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'SoilCrust', outputs);
end
