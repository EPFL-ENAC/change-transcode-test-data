function  [SvF,Ct]  = Sky_View_Factor(DTM,SLO,ASP,HZ,Z)
% Wrapper for logging I/O to tc.Sky_View_Factor
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Sky_View_Factor', inputs);

     [SvF,Ct]  = tc.Sky_View_Factor(DTM,SLO,ASP,HZ,Z);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Sky_View_Factor', outputs);
end
