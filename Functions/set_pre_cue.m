function [INFO] = set_pre_cue(myWindow,INFO, itrial)
% Set the pre-cue on the screen

if INFO.T(itrial).pre_cue == 1 % Left pre-cue
    %[myWindow, windowRect] = PsychImaging('OpenWindow', INFO.P.screen.screen_num, INFO.P.stim.background_color);
    Screen ('FillRect', myWindow, INFO.P.stim.cue_color, INFO.P.stim.cue_rects_1);
    Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_rects);
    Screen('Flip', myWindow);
else %INFO.T. = 2 Right pre-cue
    %[myWindow, windowRect] = PsychImaging('OpenWindow', INFO.P.screen.screen_num, INFO.P.stim.background_color);
    Screen ('FillRect', myWindow,INFO.P.stim.cue_color,INFO.P.stim.cue_rects_2);
    Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_rects);
    Screen('Flip', myWindow);
end
% wakeup=WaitSecs(INFO.P.paradigm_precue)
%WaitSecs(INFO.P.paradigm_precue)
