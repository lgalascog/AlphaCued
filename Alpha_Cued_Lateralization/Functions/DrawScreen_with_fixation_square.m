function [INFO] = DrawScreen_with_fixation_square(myWindow,INFO)

% Display square fixation
Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color,...
    INFO.P.stim.fixation_rects); %Add square fixation
Screen('Flip', myWindow);