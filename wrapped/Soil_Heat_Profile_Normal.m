function [G0,T,Gn] = Soil_Heat_Profile_Normal(Tup,dt,Ttm1,ms,Zs,lanS,cv,Tdown,G0,Gn,OPZ)
% Wrapper for logging I/O to tc.Soil_Heat_Profile_Normal
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Soil_Heat_Profile_Normal', inputs);

    [G0,T,Gn] = tc.Soil_Heat_Profile_Normal(Tup,dt,Ttm1,ms,Zs,lanS,cv,Tdown,G0,Gn,OPZ);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Soil_Heat_Profile_Normal', outputs);
end
