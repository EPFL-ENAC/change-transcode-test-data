function [B,LAI,LAIdead,RBi] = Grass_Cut_Grazing(B,LAI,LAIdead,dtd,aSE,Sl,mSl,jDay,jDay_cut,LAI_cut)
% Wrapper for logging I/O to tc.Grass_Cut_Grazing
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Grass_Cut_Grazing', inputs);

    [B,LAI,LAIdead,RBi] = tc.Grass_Cut_Grazing(B,LAI,LAIdead,dtd,aSE,Sl,mSl,jDay,jDay_cut,LAI_cut);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Grass_Cut_Grazing', outputs);
end
