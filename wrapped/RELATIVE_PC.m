function [e_rel] = RELATIVE_PC(AgeL,dflo,NBL_Im,BLeaf,age_cr,aSE,L_day,Lmax_day,jDay)
% Wrapper for logging I/O to tc.RELATIVE_PC
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'RELATIVE_PC', inputs);

    [e_rel] = tc.RELATIVE_PC(AgeL,dflo,NBL_Im,BLeaf,age_cr,aSE,L_day,Lmax_day,jDay);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'RELATIVE_PC', outputs);
end
