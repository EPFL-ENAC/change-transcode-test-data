function [H,QE,Qv,T_H,T_L,EIn_H,EIn_L,EG,ESN,ESN_In,EWAT,ELitter,EICE,EIn_urb,EIn_rock] = Heat_fluxes(dt, Ta,Ts,ea,Pre,Csno,Crock,Curb,Cwat,Cbare,Cice,Cicew,Csnow,CLitter,Cdeb, dw_L,dw_H,dw_SNO,Ccrown,FsunH,FshdH, FsunL,FshdL,LAI_H,LAI_L,SAI_H,SAI_L, In_H,In_L,In_urb,In_rock,SWE,In_SWE, Pr_liq,Pr_sno,ra,rs_sunH,rs_sunL,rs_shdH,rs_shdL,rb_H,rb_L,rap_H,rap_L,r_litter, r_soil,b_soil,alp_soil,Vavail,Vavail_plant_H,Vavail_plant_L,WAT_avail,ICE_avail,In_Litter,alp_litter)
% Wrapper for logging I/O to tc.Heat_fluxes
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Heat_fluxes', inputs);

    [H,QE,Qv,T_H,T_L,EIn_H,EIn_L,EG,ESN,ESN_In,EWAT,ELitter,EICE,EIn_urb,EIn_rock] = tc.Heat_fluxes(dt, Ta,Ts,ea,Pre,Csno,Crock,Curb,Cwat,Cbare,Cice,Cicew,Csnow,CLitter,Cdeb, dw_L,dw_H,dw_SNO,Ccrown,FsunH,FshdH, FsunL,FshdL,LAI_H,LAI_L,SAI_H,SAI_L, In_H,In_L,In_urb,In_rock,SWE,In_SWE, Pr_liq,Pr_sno,ra,rs_sunH,rs_sunL,rs_shdH,rs_shdL,rb_H,rb_L,rap_H,rap_L,r_litter, r_soil,b_soil,alp_soil,Vavail,Vavail_plant_H,Vavail_plant_L,WAT_avail,ICE_avail,In_Litter,alp_litter);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Heat_fluxes', outputs);
end
