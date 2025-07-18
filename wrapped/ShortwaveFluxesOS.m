function [Rabsb,Rrfl_vis,Rrfl_nir] = ShortwaveFluxesOS(Rsw,SvF,alb)
% Wrapper for logging I/O to tc.ShortwaveFluxesOS
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'ShortwaveFluxesOS', inputs);

    [Rabsb,Rrfl_vis,Rrfl_nir] = tc.ShortwaveFluxesOS(Rsw,SvF,alb);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'ShortwaveFluxesOS', outputs);
end
