function [B,RB,LAI,LAIdead,ManI,PHE_S,dflo,AgeL,AgeDL] = Crop_Planting_Harvest(B,RBtm1,dtd,LAI,LAIdead,PHE_S,dflo,AgeL,AgeDL,Datam,Mpar)
% Wrapper for logging I/O to tc.Crop_Planting_Harvest
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Crop_Planting_Harvest', inputs);

    [B,RB,LAI,LAIdead,ManI,PHE_S,dflo,AgeL,AgeDL] = tc.Crop_Planting_Harvest(B,RBtm1,dtd,LAI,LAIdead,PHE_S,dflo,AgeL,AgeDL,Datam,Mpar);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Crop_Planting_Harvest', outputs);
end
