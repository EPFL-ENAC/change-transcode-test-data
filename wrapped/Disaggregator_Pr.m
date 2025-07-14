function [Prs] = Disaggregator_Pr(Pr,pow,a)
% Wrapper for logging I/O to tc.Disaggregator_Pr
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Disaggregator_Pr', inputs);

    [Prs] = tc.Disaggregator_Pr(Pr,pow,a);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Disaggregator_Pr', outputs);
end
