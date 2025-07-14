function [DCi] = CO2_Concentration(Cc,IPAR,Csl,ra,rb,Ts,Pre,Ds, Psi_L,Psi_sto_50,Psi_sto_99,CT,Vmax,DS,Ha,FI,Oa,Do,a1,go,gmes,rjv)
% Wrapper for logging I/O to tc.CO2_Concentration
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'CO2_Concentration', inputs);

    [DCi] = tc.CO2_Concentration(Cc,IPAR,Csl,ra,rb,Ts,Pre,Ds, Psi_L,Psi_sto_50,Psi_sto_99,CT,Vmax,DS,Ha,FI,Oa,Do,a1,go,gmes,rjv);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'CO2_Concentration', outputs);
end
