function [zom,zoh,disp_h,zom_H,zom_L,zoh_H,zoh_L,d_H,d_L,zom_other] = Roughness_New(D,ydepth,ICE_D,Cdeb,Deb_Par,Urb_Par,hc_H,hc_L,LAI_H,Ccrown_L,Cwat,Curb,Crock,Cice)
% Wrapper for logging I/O to tc.Roughness_New
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Roughness_New', inputs);

    [zom,zoh,disp_h,zom_H,zom_L,zoh_H,zoh_L,d_H,d_L,zom_other] = tc.Roughness_New(D,ydepth,ICE_D,Cdeb,Deb_Par,Urb_Par,hc_H,hc_L,LAI_H,Ccrown_L,Cwat,Curb,Crock,Cice);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Roughness_New', outputs);
end
