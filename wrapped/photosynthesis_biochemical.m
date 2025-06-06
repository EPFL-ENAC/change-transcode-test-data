function [CcF,An,rs,Rdark,F755nm,GAM,gsCO2] = photosynthesis_biochemical(Cc,IPAR,Csl,ra,rb,Ts,Pre,Ds, Psi_L,Psi_sto_50,Psi_sto_00, CT,Vmax,DS,Ha,FI,Oa,Do,a1,go,gmes,rjv)
% Wrapper for logging I/O to tc.photosynthesis_biochemical
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('photosynthesis_biochemical', inputs);

    [CcF,An,rs,Rdark,F755nm,GAM,gsCO2] = tc.photosynthesis_biochemical(Cc,IPAR,Csl,ra,rb,Ts,Pre,Ds, Psi_L,Psi_sto_50,Psi_sto_00, CT,Vmax,DS,Ha,FI,Oa,Do,a1,go,gmes,rjv);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('photosynthesis_biochemical', outputs);
end
