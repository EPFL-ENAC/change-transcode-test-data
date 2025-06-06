function [V,T_H,T_L,EG,Lk] = Volume_Correction(V,EvL_Zs,RfH_Zs,RfL_Zs,EG,T_H,T_L,Lk)
% Wrapper for logging I/O to tc.Volume_Correction
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Volume_Correction', inputs);

    [V,T_H,T_L,EG,Lk] = tc.Volume_Correction(V,EvL_Zs,RfH_Zs,RfL_Zs,EG,T_H,T_L,Lk);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Volume_Correction', outputs);
end
