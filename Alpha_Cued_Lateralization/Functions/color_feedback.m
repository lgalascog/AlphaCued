function [INFO] = color_feedback(myWindow, INFO, itrial)

if INFO.T(itrial).Correct_attention == 1
    my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,...
        INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color, [0 128 0],...
        INFO.P.screen.pixperdeg)
    
else
    my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,...
        INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color, [255 0 0],...
        INFO.P.screen.pixperdeg)
    
end
Screen('DrawingFinished', myWindow); 