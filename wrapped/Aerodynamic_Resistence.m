function [ra] = Aerodynamic_Resistence(Ta,Ts,Pre,zatm,disp_h,zom,zoh,Ws,ea)
% Wrapper for logging I/O to tc.Aerodynamic_Resistence
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Aerodynamic_Resistence', inputs);

    [ra] = tc.Aerodynamic_Resistence(Ta,Ts,Pre,zatm,disp_h,zom,zoh,Ws,ea);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Aerodynamic_Resistence', outputs);
end
