function [INFO] = set_probe_target(myWindow,INFO, itrial) %,location_right_probes,location_left_probes)
% Set the detection probes gabor

color = INFO.P.stim.background_color + (INFO.T(itrial).Contrast_probes * (255 - INFO.P.stim.background_color(1)));
location_probes_number_right = INFO.T(itrial).probes_position_right;
location_probes_number_left = INFO.T(itrial).probes_position_left;
location_probes_right = INFO.P.position(2,location_probes_number_right,:)
location_probes_left = INFO.P.position(1,location_probes_number_left,:)

if INFO.T(itrial).probes == 1
    Screen('BlendFunction', myWindow, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    Screen('DrawDots', myWindow, [location_probes_right(1) location_probes_right(2)], INFO.P.circle_detection_size_pix, color, [], 2);
    my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,...
       INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color,...
       INFO.P.stim.background_color, INFO.P.screen.pixperdeg)
    Screen('Flip', myWindow);

end

if INFO.T(itrial).probes == 2
    Screen('BlendFunction', myWindow, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    Screen('DrawDots', myWindow, [location_probes_left(1) location_probes_left(2)], INFO.P.circle_detection_size_pix, color, [], 2);
    my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,... 
        INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color,... 
        INFO.P.stim.background_color, INFO.P.screen.pixperdeg)
    Screen('Flip', myWindow);

end

if INFO.T(itrial).probes == 3
    Screen('BlendFunction', myWindow, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    Screen('DrawDots', myWindow, [location_probes_right(1) location_probes_right(2)], INFO.P.circle_detection_size_pix, color, [], 2);
    
    Screen('DrawDots', myWindow, [location_probes_left(1) location_probes_left(2)], INFO.P.circle_detection_size_pix, color, [], 2);
    my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,...
        INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color,...
        INFO.P.stim.background_color, INFO.P.screen.pixperdeg)
    Screen('Flip', myWindow);

end

if INFO.T(itrial).probes == 4
    my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,...
        INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color,...
        INFO.P.stim.background_color, INFO.P.screen.pixperdeg)
    Screen('Flip', myWindow);

end