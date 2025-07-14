function [Labs] = LongwaveFluxesOS(Ts,Latm,SvF,e_sur)
% Wrapper for logging I/O to tc.LongwaveFluxesOS
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'LongwaveFluxesOS', inputs);

    [Labs] = tc.LongwaveFluxesOS(Ts,Latm,SvF,e_sur);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'LongwaveFluxesOS', outputs);
end
