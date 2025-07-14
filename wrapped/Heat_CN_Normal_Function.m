function  [T]  = Heat_CN_Normal_Function(Ttm1,dts,lanS,cv,Zs,Tup,Tdown,Gn,G0,OPZ)
% Wrapper for logging I/O to tc.Heat_CN_Normal_Function
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Heat_CN_Normal_Function', inputs);

     [T]  = tc.Heat_CN_Normal_Function(Ttm1,dts,lanS,cv,Zs,Tup,Tdown,Gn,G0,OPZ);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Heat_CN_Normal_Function', outputs);
end
