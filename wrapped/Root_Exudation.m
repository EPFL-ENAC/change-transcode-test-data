function [RexmyT] = Root_Exudation(NPP,Broot,Bam,Bem,Creserve,rMc,rNc,rPc,rKc,ParEx,NupIm,NavlI,EM,Tdp)
% Wrapper for logging I/O to tc.Root_Exudation
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Root_Exudation', inputs);

    [RexmyT] = tc.Root_Exudation(NPP,Broot,Bam,Bem,Creserve,rMc,rNc,rPc,rKc,ParEx,NupIm,NavlI,EM,Tdp);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Root_Exudation', outputs);
end
