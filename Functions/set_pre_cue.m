function [INFO] = set_pre_cue(myWindow,INFO, itrial)
% Set the pre-cue on the screen

if INFO.T(itrial).pre_cue == 1 % Right pre-cue
    Screen('Drawline', myWindow, INFO.P.stim.cue_color,...
        INFO.P.stim.cue_RIGHT_xPosStart,INFO.P.stim.cue_RIGHT_yPosStart,...
        INFO.P.stim.cue_RIGHT_xPosEnd,INFO.P.stim.cue_RIGHT_yPosEnd,...
        INFO.P.stim.cue_width_pix);
    my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,...
        INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color,...
        INFO.P.stim.background_color, INFO.P.screen.pixperdeg)
else %INFO.T. = 2 Left pre-cue
    Screen('Drawline', myWindow, INFO.P.stim.cue_color,...
        INFO.P.stim.cue_LEFT_xPosStart,INFO.P.stim.cue_LEFT_yPosStart,...
        INFO.P.stim.cue_LEFT_xPosEnd,INFO.P.stim.cue_LEFT_yPosEnd,...
        INFO.P.stim.cue_width_pix);
    my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,...
        INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color,...
        INFO.P.stim.background_color, INFO.P.screen.pixperdeg)

end
Screen('Flip', myWindow);