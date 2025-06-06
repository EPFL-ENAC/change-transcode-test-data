function [rap_H,rap_L,rb_H,rb_L,Ws_und] = Undercanopy_Leaf_Resistence2(Ws,Ta,Ts,Ccrown,hc_H,hc_L,LAI_H,LAI_L,d_leaf_H,d_leaf_L, zatm,disp_h,zom,zom_under,SND,disp_h_H,zom_H,disp_h_L,zom_L)
% Wrapper for logging I/O to tc.Undercanopy_Leaf_Resistence2
    w = whos;
    inputs = struct();
    for a = 1:length(w)
        inputs.(w(a).name) = eval(w(a).name);
    end
    log_inputs('Undercanopy_Leaf_Resistence2', inputs);

    [rap_H,rap_L,rb_H,rb_L,Ws_und] = tc.Undercanopy_Leaf_Resistence2(Ws,Ta,Ts,Ccrown,hc_H,hc_L,LAI_H,LAI_L,d_leaf_H,d_leaf_L, zatm,disp_h,zom,zom_under,SND,disp_h_H,zom_H,disp_h_L,zom_L);
    
    w = whos;
    outputs = struct();
    for a = 1:length(w)
        outputs.(w(a).name) = eval(w(a).name);
    end
    log_outputs('Undercanopy_Leaf_Resistence2', outputs);
end
