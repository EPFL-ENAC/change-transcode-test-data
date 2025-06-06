function [Pr_sno,Pr_liq] = Precipitation_partition(Pr,Ta,Tmin,Tmax,ea,Pre)
% Wrapper for logging I/O to tc.Precipitation_partition
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Precipitation_partition', inputs);

    [Pr_sno,Pr_liq] = tc.Precipitation_partition(Pr,Ta,Tmin,Tmax,ea,Pre);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Precipitation_partition', outputs);
end
