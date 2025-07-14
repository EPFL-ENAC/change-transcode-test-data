function [FNC,e_relN,rNc,rPc,rKc,rMc,rNcR,Navail,Pavail,Kavail] = Nutrients_Available(B,FNCtm1,St,Nreserve,Preserve,Kreserve,OPT_SoilBiogeochemistry)
% Wrapper for logging I/O to tc.Nutrients_Available
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Nutrients_Available', inputs);

    [FNC,e_relN,rNc,rPc,rKc,rMc,rNcR,Navail,Pavail,Kavail] = tc.Nutrients_Available(B,FNCtm1,St,Nreserve,Preserve,Kreserve,OPT_SoilBiogeochemistry);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Nutrients_Available', outputs);
end
