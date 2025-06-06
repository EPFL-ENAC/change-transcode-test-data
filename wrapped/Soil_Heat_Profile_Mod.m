function [G0,T] = Soil_Heat_Profile_Mod(Ts,dt,Ttm1,dz,Dz,nz,lanS,cv_soil,Csno,Cice,G0)
% Wrapper for logging I/O to tc.Soil_Heat_Profile_Mod
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Soil_Heat_Profile_Mod', inputs);

    [G0,T] = tc.Soil_Heat_Profile_Mod(Ts,dt,Ttm1,dz,Dz,nz,lanS,cv_soil,Csno,Cice,G0);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Soil_Heat_Profile_Mod', outputs);
end
