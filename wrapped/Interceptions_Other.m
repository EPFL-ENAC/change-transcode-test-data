function [In_urb,In_rock,SE_rock,SE_urb] = Interceptions_Other(dt, Csno,Crock,Curb,Cice, In_urbtm1,In_rocktm1,In_max_urb,In_max_rock, Pr_liq,WR_SP,WR_IP,q_runon,EIn_urb,EIn_rock)
% Wrapper for logging I/O to tc.Interceptions_Other
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Interceptions_Other', inputs);

    [In_urb,In_rock,SE_rock,SE_urb] = tc.Interceptions_Other(dt, Csno,Crock,Curb,Cice, In_urbtm1,In_rocktm1,In_max_urb,In_max_rock, Pr_liq,WR_SP,WR_IP,q_runon,EIn_urb,EIn_rock);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Interceptions_Other', outputs);
end
