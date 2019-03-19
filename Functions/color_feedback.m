function [INFO] = color_feedback(myWindow, INFO, itrial)

if INFO.T(itrial).attention == 1 & INFO.T(itrial).button_attention(1) == 'R'
    my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy, INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color, [0 128 0], INFO.P.screen.pixperdeg)
    Screen('Flip', myWindow);
    
elseif INFO.T(itrial).attention == 3 & INFO.T(itrial).button_attention(1) == 'R'
    my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy, INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color, [0 128 0], INFO.P.screen.pixperdeg)
    Screen('Flip', myWindow);
    
elseif INFO.T(itrial).attention == 2 & INFO.T(itrial).button_attention(1) == 'L'
    my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy, INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color, [0 128 0], INFO.P.screen.pixperdeg)
    Screen('Flip', myWindow);     
    
elseif INFO.T(itrial).attention == 4 & INFO.T(itrial).button_attention(1) == 'L'
    my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy, INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color, [0 128 0], INFO.P.screen.pixperdeg)
    Screen('Flip', myWindow);   
    
else
    my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy, INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color, [255 0 0], INFO.P.screen.pixperdeg)
    Screen('Flip', myWindow);
end
    