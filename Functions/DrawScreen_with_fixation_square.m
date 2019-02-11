% Create the background
gray = GrayIndex(INFO.P.screen.screen_num);
[myWindow, windowRect] = PsychImaging('OpenWindow', INFO.P.screen.screen_num, gray);%Open the screen and set the grey color / There ise a problem but I don't know how to use INFO.P.stim.background_color

% Display square fixation
Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_rects); %Add square fixation
Screen('Flip', myWindow);