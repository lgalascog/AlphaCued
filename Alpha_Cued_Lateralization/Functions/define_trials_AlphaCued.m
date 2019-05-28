function INFO = define_trials_AlphaCued(INFO, Validity)
% 2 pre-cue
% 5 probes
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
                        
                        if iposition_probes_right == iposition_attention
                            continue
                        end
                        if iposition_probes_left == iposition_attention
                            continue
                        end
                        itrial = itrial + 1;
                        
                        if Validity == 1
                            TValid(itrial).pre_cue = ipre_cue ;% 50% trials precue left and 50% right
                            TValid(itrial).probes_position_right = iposition_probes_right;
                            TValid(itrial).probes_position_left = iposition_probes_left;
                            TValid(itrial).probes = iprobes;
                            TValid(itrial).attention_position = iposition_attention;
                            
                            TValid(itrial).validity = [];
                            TValid(itrial).orientation = [];
                            TValid(itrial).Contrast_probes = [];
                            TValid(itrial).Contrast_attention = [];
                            TValid(itrial).button_pressed = [];
                            TValid(itrial).button_probes_right = [];
                            TValid(itrial).button_probes_left = [];
                            TValid(itrial).button_attention = [];
                            TValid(itrial).Correct_probes_right = [];
                            TValid(itrial).Correct_probes_left = [];
                            TValid(itrial).Correct_attention = [];
                            TValid(itrial).Probes_right = [];
                            TValid(itrial).Probes_left = [];
                            
                            %Flips timing
                            TValid(itrial).vbl_fixation = [];
                            TValid(itrial).vbl_cue = [];
                            TValid(itrial).vbl_delay1 = [];
                            TValid(itrial).vbl_target = [];
                            TValid(itrial).vbl_delay2 = [];
                            TValid(itrial).vbl_feedback = [];
                            
                            TValid(itrial).GazeHasMovedOrEyeIsLost = 0;
                        elseif Validity == 2
                            TInvalid(itrial).pre_cue = ipre_cue ;% 50% trials precue left and 50% right
                            TInvalid(itrial).probes_position_right = iposition_probes_right;
                            TInvalid(itrial).probes_position_left = iposition_probes_left;
                            TInvalid(itrial).probes = iprobes;
                            TInvalid(itrial).attention_position = iposition_attention;
                            
                            TInvalid(itrial).validity = [];
                            TInvalid(itrial).orientation = [];
                            TInvalid(itrial).Contrast_probes = [];
                            TInvalid(itrial).Contrast_attention = [];
                            TInvalid(itrial).button_pressed = [];
                            TInvalid(itrial).button_probes_right = [];
                            TInvalid(itrial).button_probes_left = [];
                            TInvalid(itrial).button_attention = [];
                            TInvalid(itrial).Correct_probes_right = [];
                            TInvalid(itrial).Correct_probes_left = [];
                            TInvalid(itrial).Correct_attention = [];
                            TInvalid(itrial).Probes_right = [];
                            TInvalid(itrial).Probes_left = [];
                            
                            %Flips timing
                            TInvalid(itrial).vbl_fixation = [];
                            TInvalid(itrial).vbl_cue = [];
                            TInvalid(itrial).vbl_delay1 = [];
                            TInvalid(itrial).vbl_target = [];
                            TInvalid(itrial).vbl_delay2 = [];
                            TInvalid(itrial).vbl_feedback = [];
                            
                            TInvalid(itrial).GazeHasMovedOrEyeIsLost = 0;
                        end      
                    end
                end
            end
        end
    end
end

if Validity == 1
    INFO.TValid = Shuffle(TValid);
elseif Validity == 2
    INFO.TInvalid = Shuffle(TInvalid);
end
%% Done.