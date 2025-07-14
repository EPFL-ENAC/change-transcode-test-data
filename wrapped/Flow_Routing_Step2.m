function  [FM] = Flow_Routing_Step2(E,T,Qrdt)
% Wrapper for logging I/O to tc.Flow_Routing_Step2
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Flow_Routing_Step2', inputs);

     [FM] = tc.Flow_Routing_Step2(E,T,Qrdt);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Flow_Routing_Step2', outputs);
end
