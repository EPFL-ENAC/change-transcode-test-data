function [In_max_SWE,In_max_L,In_max_H] = Maximum_Interception(Ccrown,LAI_L,LAI_H,SAI_H,SAI_L, Ta,Sp_SN_In,Sp_LAI_L_In,Sp_LAI_H_In)
% Wrapper for logging I/O to tc.Maximum_Interception
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Maximum_Interception', inputs);

    [In_max_SWE,In_max_L,In_max_H] = tc.Maximum_Interception(Ccrown,LAI_L,LAI_H,SAI_H,SAI_L, Ta,Sp_SN_In,Sp_LAI_L_In,Sp_LAI_H_In);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Maximum_Interception', outputs);
end
