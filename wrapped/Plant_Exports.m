function [TexC,TexN,TexP,TexK,TNIT,TPHO,TPOT,NuLIT,NreserveM,PreserveM,KreserveM,SupN,SupP,SupK,IS] = Plant_Exports(B,Btm1, NuLITtm1,Slf,Sfr,Swm,Sll,Sr,Rexmy,St,Mpar,fab,fbe,RB,Nreserve,Preserve,Kreserve,rNc,rPc,rKc,ManI,OPT_SB)
% Wrapper for logging I/O to tc.Plant_Exports
    global id_location;
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs(id_location, 'Plant_Exports', inputs);

    [TexC,TexN,TexP,TexK,TNIT,TPHO,TPOT,NuLIT,NreserveM,PreserveM,KreserveM,SupN,SupP,SupK,IS] = tc.Plant_Exports(B,Btm1, NuLITtm1,Slf,Sfr,Swm,Sll,Sr,Rexmy,St,Mpar,fab,fbe,RB,Nreserve,Preserve,Kreserve,rNc,rPc,rKc,ManI,OPT_SB);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs(id_location, 'Plant_Exports', outputs);
end
