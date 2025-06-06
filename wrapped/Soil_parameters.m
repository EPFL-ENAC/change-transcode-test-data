function [Osat,L,Pe,Ks,O33,rsd,lan_dry,lan_s,cv_s,K_usle] = Soil_parameters(Psan,Pcla,Porg)
% Wrapper for logging I/O to tc.Soil_parameters
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Soil_parameters', inputs);

    [Osat,L,Pe,Ks,O33,rsd,lan_dry,lan_s,cv_s,K_usle] = tc.Soil_parameters(Psan,Pcla,Porg);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Soil_parameters', outputs);
end
