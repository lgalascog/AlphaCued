%Set response cue

    if INFO.P. =0
        Screen ('FillRect', myWindow,INFO.P.stim.target_color,INFO.P.stim.target_positions_1)
        Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_square_position);
        Screen('Flip', myWindow);
        'Left'
    else INFO.P. =1
        Screen ('FillRect', myWindow,INFO.P.stim.target_color,INFO.P.stim.target_positions_2)
        Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_square_position);
        Screen('Flip', myWindow);
        'right'
    end