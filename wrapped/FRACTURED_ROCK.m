function [Q_channel,FROCK,Qflow_rock] = FRACTURED_ROCK(Q_channeltm1,FROCKtm1,SNn,dth,m_cell,n_cell,num_cell,Kres_Rock)
% Wrapper for logging I/O to tc.FRACTURED_ROCK
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('FRACTURED_ROCK', inputs);

    [Q_channel,FROCK,Qflow_rock] = tc.FRACTURED_ROCK(Q_channeltm1,FROCKtm1,SNn,dth,m_cell,n_cell,num_cell,Kres_Rock);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('FRACTURED_ROCK', outputs);
end
