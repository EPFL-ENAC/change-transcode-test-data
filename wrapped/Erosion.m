function [er,ke] = Erosion(dt,Pr_liq,hc_H,hc_L,K_usle,Ccrown,Cbare,Csno,Cfol_H,Cfol_L,CLitter,Dr_H,Dr_L)
% Wrapper for logging I/O to tc.Erosion
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Erosion', inputs);

    [er,ke] = tc.Erosion(dt,Pr_liq,hc_H,hc_L,K_usle,Ccrown,Cbare,Csno,Cfol_H,Cfol_L,CLitter,Dr_H,Dr_L);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Erosion', outputs);
end
