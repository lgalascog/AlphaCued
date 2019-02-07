function [INFO] = set_response_cue(INFO, itrial)
%Set response cue

%Find pre_position
INFO.T(1,itrial).pre_cue = pre_cue_position


if INFO.T(1,itrial).response_cue == 1 %If pre_cue = response_cue
    if pre_cue_position == 1 %pre_cue left
        Screen ('FillRect', myWindow,INFO.P.stim.target_color,INFO.P.stim.target_positions_1)
        Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_square_position);
        Screen('Flip', myWindow);
        'Left'
    else
        Screen ('FillRect', myWindow,INFO.P.stim.target_color,INFO.P.stim.target_positions_2)
        Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_square_position);
        Screen('Flip', myWindow);
        'right'
    end
else %If pre_cue =/= response_cue
    if pre_cue_position == 1 %pre_cue left and post_cue right
        Screen ('FillRect', myWindow,INFO.P.stim.target_color,INFO.P.stim.target_positions_2)
        Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_square_position);
        Screen('Flip', myWindow);
        'right'
    else
        Screen ('FillRect', myWindow,INFO.P.stim.target_color,INFO.P.stim.target_positions_1)
        Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_square_position);
        Screen('Flip', myWindow);
        'Left'
    end
end