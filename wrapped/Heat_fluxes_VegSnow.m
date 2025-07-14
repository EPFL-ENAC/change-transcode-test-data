function [H,QE,T_H,EIn_H] = Heat_fluxes_VegSnow(dt, Ta,Ts,ea,Pre,Csno, dw_H,dw_SNO,Ccrown,FsunH,FshdH, LAI_H,SAI_H,In_H, ra,rs_sunH,rs_shdH,rb_H,Vavail_plant_H)
% Wrapper for logging I/O to tc.Heat_fluxes_VegSnow
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Heat_fluxes_VegSnow', inputs);

    [H,QE,T_H,EIn_H] = tc.Heat_fluxes_VegSnow(dt, Ta,Ts,ea,Pre,Csno, dw_H,dw_SNO,Ccrown,FsunH,FshdH, LAI_H,SAI_H,In_H, ra,rs_sunH,rs_shdH,rb_H,Vavail_plant_H);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Heat_fluxes_VegSnow', outputs);
end
