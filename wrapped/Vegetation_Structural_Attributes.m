function [Ccrown_t,Hc,SAI,BA,Tden,AgePl,TBio] = Vegetation_Structural_Attributes(dt,Ccrown_tm1,B,fab,Tden_tm1,AgePl_tm1,OPT_ALLOME)
% Wrapper for logging I/O to tc.Vegetation_Structural_Attributes
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Vegetation_Structural_Attributes', inputs);

    [Ccrown_t,Hc,SAI,BA,Tden,AgePl,TBio] = tc.Vegetation_Structural_Attributes(dt,Ccrown_tm1,B,fab,Tden_tm1,AgePl_tm1,OPT_ALLOME);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Vegetation_Structural_Attributes', outputs);
end
