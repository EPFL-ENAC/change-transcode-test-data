function [B,RB,LAI,LAIdead,ManI] = Forest_Logging_Fire(B,RBtm1,dtd,Sl,mSl,aSE,LAI,LAIdead,Datam,Mpar)
% Wrapper for logging I/O to tc.Forest_Logging_Fire
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Forest_Logging_Fire', inputs);

    [B,RB,LAI,LAIdead,ManI] = tc.Forest_Logging_Fire(B,RBtm1,dtd,Sl,mSl,aSE,LAI,LAIdead,Datam,Mpar);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Forest_Logging_Fire', outputs);
end
