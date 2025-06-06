function [In_deb,SE_deb] = Interceptions_Debris(dt,Csno,Cdeb, In_debtm1,In_max_deb, Pr_liq,WR_SP,EIn_deb)
% Wrapper for logging I/O to tc.Interceptions_Debris
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Interceptions_Debris', inputs);

    [In_deb,SE_deb] = tc.Interceptions_Debris(dt,Csno,Cdeb, In_debtm1,In_max_deb, Pr_liq,WR_SP,EIn_deb);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Interceptions_Debris', outputs);
end
