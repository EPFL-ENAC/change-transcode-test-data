function [r_litter,alp_litter] = Litter_Resistence(Ws,Ta,Pre,zatm,disp_h,zom,Sllit,BLit,In_Litter)
% Wrapper for logging I/O to tc.Litter_Resistence
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Litter_Resistence', inputs);

    [r_litter,alp_litter] = tc.Litter_Resistence(Ws,Ta,Pre,zatm,disp_h,zom,Sllit,BLit,In_Litter);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Litter_Resistence', outputs);
end
