function [INFO] = set_pre_cue(INFO, itrial)

% Set the pre-cue on the screen

if INFO.T(1,itrial).pre_cue == 1 % Left pre-cue
    Screen ('FillRect', myWindow,INFO.P.stim.target_color,INFO.P.stim.cue_positions_1)
    Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_square_position);
    Screen('Flip', myWindow);
    'Left'
else %INFO.T. = 2 Right pre-cue
    Screen ('FillRect', myWindow,INFO.P.stim.target_color,INFO.P.stim.cue_positions_2)
    Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_square_position);
    Screen('Flip', myWindow);
    'right'
end

WaitSecs('UntilTime', INFO.P.paradigm_precue)
