function [INFO] = set_response_cue(myWindow, INFO, itrial)
%Set response cue

% %Find pre_position
pre_cue_position = INFO.T(itrial).pre_cue 


if INFO.T(itrial).response_cue == 1 %If pre_cue = response_cue
    if pre_cue_position == 1 %pre_cue left
        Screen ('FillRect', myWindow,INFO.P.stim.cue_color,INFO.P.stim.cue_rects_1)
        Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_rects);
        Screen('Flip', myWindow);
        'Left'
    else
        Screen ('FillRect', myWindow,INFO.P.stim.cue_color,INFO.P.stim.cue_rects_2)
        Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_rects);
        Screen('Flip', myWindow);
        'right'
    end
else %If pre_cue =/= response_cue
    if pre_cue_position == 1 %pre_cue left and post_cue right
        Screen ('FillRect', myWindow,INFO.P.stim.cue_color,INFO.P.stim.cue_rects_2)
        Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_rects);
        Screen('Flip', myWindow);
        'right'
    else
        Screen ('FillRect', myWindow,INFO.P.stim.cue_color,INFO.P.stim.cue_rects_1)
        Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_rects);
        Screen('Flip', myWindow);
        'Left'
    end
end