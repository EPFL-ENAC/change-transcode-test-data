function  [Psi]  = Plant_PV_Curve(V,C,TYP,LAI,Axyl,H,Sl)
% Wrapper for logging I/O to tc.Plant_PV_Curve
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Plant_PV_Curve', inputs);

     [Psi]  = tc.Plant_PV_Curve(V,C,TYP,LAI,Axyl,H,Sl);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Plant_PV_Curve', outputs);
end
