function [G0,T,S] = Soil_Heat_Profile(Ts,dt,Stm1,dz,Dz,nz,lanS,cv_soil,Csno,Cice,OPT_ST,G0)
% Wrapper for logging I/O to tc.Soil_Heat_Profile
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Soil_Heat_Profile', inputs);

    [G0,T,S] = tc.Soil_Heat_Profile(Ts,dt,Stm1,dz,Dz,nz,lanS,cv_soil,Csno,Cice,OPT_ST,G0);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Soil_Heat_Profile', outputs);
end
