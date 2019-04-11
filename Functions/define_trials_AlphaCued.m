function INFO = define_trials_AlphaCued(INFO)
% 2 pre-cue
% 4 probes
% 2 attention targets with 2 orientations for each : 4
% 2 response-cue
% 2 possible questions sequences
itrial = 0;
for irepeat = 1 :INFO.P.paradigm.n_trials; %???
    for ipre_cue = 1 :INFO.P.paradigm.pre_cue;
        for iposition_probes_right = 1: INFO.P.n_positions;
            for iposition_probes_left = 1: INFO.P.n_positions;
                for iprobes = 1 :INFO.P.paradigm.probes;
                    for iposition_attention = 1: INFO.P.n_positions;
                        for ivalidity = [1 1 1 1 1 1 1 2 2 2];
                            for iorientation = [1 2];
                                
                                if iposition_probes_right == iposition_attention
                                    continue
                                end
                                if iposition_probes_left == iposition_attention
                                    continue
                                end
                                itrial = itrial + 1;
                                
                                
                                T(itrial).pre_cue = ipre_cue ;% 50% trials precue left and 50% right
                                T(itrial).probes_position_right = iposition_probes_right;
                                T(itrial).probes_position_left = iposition_probes_left;
                                T(itrial).probes = iprobes;
                                T(itrial).attention_position = iposition_attention;
                                T(itrial).validity = ivalidity;
                                T(itrial).orientation = iorientation;
                                
                                T(itrial).Contrast_probes = [];
                                T(itrial).Contrast_attention = [];
                                T(itrial).button_pressed = [];
                                T(itrial).button_probes_right = [];
                                T(itrial).button_probes_left = [];
                                T(itrial).button_attention = [];
                                T(itrial).Correct_probes_right = [];
                                T(itrial).Correct_probes_left = [];
                                T(itrial).Correct_attention = [];
                                
                                T(itrial).GazeHasMovedOrEyeIsLost = [];
                            end
                        end
                    end
                end
            end
        end
    end
end


INFO.T = Shuffle(T);


%% Done.