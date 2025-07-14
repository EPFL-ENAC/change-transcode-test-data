function  [hc,SAI,B,Ccrown,Nreserve,Preserve,Kreserve,AgrHarNut]  = CropHeightType(LAI,LAIdead,cc,B,Ccrown, Nreserve,Preserve,Kreserve,ManI,Mpar,Veg_Param_Dyn,OPT_SoilBiogeochemistry)
% Wrapper for logging I/O to tc.CropHeightType
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'CropHeightType', inputs);

     [hc,SAI,B,Ccrown,Nreserve,Preserve,Kreserve,AgrHarNut]  = tc.CropHeightType(LAI,LAIdead,cc,B,Ccrown, Nreserve,Preserve,Kreserve,ManI,Mpar,Veg_Param_Dyn,OPT_SoilBiogeochemistry);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'CropHeightType', outputs);
end
