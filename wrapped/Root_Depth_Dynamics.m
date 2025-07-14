function [ZR95,Rf,ZR50,ZRmax] = Root_Depth_Dynamics(CASE_ROOT,B,Btm1,Rl,Zs,ZR95tm1,ZR50tm1,ZRmaxtm1,Bfac_day,Psan,Tdep,O,Soil_Param,a_root)
% Wrapper for logging I/O to tc.Root_Depth_Dynamics
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Root_Depth_Dynamics', inputs);

    [ZR95,Rf,ZR50,ZRmax] = tc.Root_Depth_Dynamics(CASE_ROOT,B,Btm1,Rl,Zs,ZR95tm1,ZR50tm1,ZRmaxtm1,Bfac_day,Psan,Tdep,O,Soil_Param,a_root);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Root_Depth_Dynamics', outputs);
end
