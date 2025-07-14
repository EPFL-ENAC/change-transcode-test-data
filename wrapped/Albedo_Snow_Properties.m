function [snow_alb,tau_sno,e_sno] = Albedo_Snow_Properties(dt,SWE,h_S,Ts,Ta,SWEtm1,tau_snotm1,snow_albtm1,Th_Pr_sno,Pr_sno_day,Aice,Deb_Par,Cdeb,Cice,Ta_day,Pr_sno,Pr_liq,ros,N)
% Wrapper for logging I/O to tc.Albedo_Snow_Properties
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Albedo_Snow_Properties', inputs);

    [snow_alb,tau_sno,e_sno] = tc.Albedo_Snow_Properties(dt,SWE,h_S,Ts,Ta,SWEtm1,tau_snotm1,snow_albtm1,Th_Pr_sno,Pr_sno_day,Aice,Deb_Par,Cdeb,Cice,Ta_day,Pr_sno,Pr_liq,ros,N);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Albedo_Snow_Properties', outputs);
end
