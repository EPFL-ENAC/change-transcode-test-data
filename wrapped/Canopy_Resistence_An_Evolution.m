function [rs_sun,rs_shd,Ci_sun,Ci_shd,An,Rdark,Lpho,SIF,DCi] = Canopy_Resistence_An_Evolution(PAR_sun,PAR_shd,LAI, Kopt,Knit,Fsun,Fshd,Citm1_sun,Citm1_shd, Ca,ra,rb,Ts,Ta,Pre,Ds, Psi_L,Psi_sto_50,Psi_sto_99, CT,Vmax,DS,Ha,FI,Oa,Do,a1,go,e_rel,e_relN,gmes,rjv,mSl,Sl,Opt_CR)
% Wrapper for logging I/O to tc.Canopy_Resistence_An_Evolution
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Canopy_Resistence_An_Evolution', inputs);

    [rs_sun,rs_shd,Ci_sun,Ci_shd,An,Rdark,Lpho,SIF,DCi] = tc.Canopy_Resistence_An_Evolution(PAR_sun,PAR_shd,LAI, Kopt,Knit,Fsun,Fshd,Citm1_sun,Citm1_shd, Ca,ra,rb,Ts,Ta,Pre,Ds, Psi_L,Psi_sto_50,Psi_sto_99, CT,Vmax,DS,Ha,FI,Oa,Do,a1,go,e_rel,e_relN,gmes,rjv,mSl,Sl,Opt_CR);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Canopy_Resistence_An_Evolution', outputs);
end
