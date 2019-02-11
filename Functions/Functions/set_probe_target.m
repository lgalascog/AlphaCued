function [INFO] = set_probe_target(myWindow,gabortex,INFO, itrial) %,location_right_probes,location_left_probes)
% Set the detection probes gabor


if INFO.T(itrial,2).probes == 1
    % Put a grating on the right side and no on the left
    % gabortex = CreateProceduralGabor(myWindow, INFO.P.grating_detection_width,INFO.P.grating_detection_height, [], [0.5 0.5 0.5 0.0]);
    Screen('DrawTexture', myWindow, gabortex, [], [INFO.P.location_right_probes], [INFO.P.grating_detection_tilt], [], [], [], [], kPsychDontDoRotation,...
        [INFO.P.grating_detection_phase+180, INFO.P.grating_detection_freq, INFO.P.grating_detection_sc,...
        INFO.P.grating_detection_contrast, INFO.P.grating_detection_aspectratio, 0, 0, 0]);
    Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_rects);
    Screen('Flip', myWindow);

end

if INFO.T(itrial,2).probes == 2
    % Put a grating on the left side and no on the righ
    % gabortex = CreateProceduralGabor(myWindow,INFO.P.grating_detection_width,INFO.P.grating_detection_height, [], [0.5 0.5 0.5 0.0]);
    Screen('DrawTexture', myWindow, gabortex, [], [INFO.P.location_left_probes], INFO.P.grating_detection_tilt, [], [], [], [], kPsychDontDoRotation,...
        [INFO.P.grating_detection_phase+180, INFO.P.grating_detection_freq, INFO.P.grating_detection_sc,...
        INFO.P.grating_detection_contrast, INFO.P.grating_detection_aspectratio, 0, 0, 0]);
    Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_rects);
    Screen('Flip', myWindow);

end

if INFO.T(itrial,2).probes == 3
    % Put 2 gabors
    % gabortex = CreateProceduralGabor(myWindow, INFO.P.grating_detection_width,INFO.P.grating_detection_height, [], [0.5 0.5 0.5 0.0]);
    Screen('DrawTexture', myWindow, gabortex, [], [INFO.P.location_right_probes], INFO.P.grating_detection_tilt, [], [], [], [], kPsychDontDoRotation,...
        [INFO.P.grating_detection_phase+180, INFO.P.grating_detection_freq, INFO.P.grating_detection_sc,...
        INFO.P.grating_detection_contrast, INFO.P.grating_detection_aspectratio, 0, 0, 0]);
    
    
    % gabortex = CreateProceduralGabor(myWindow, INFO.P.grating_detection_width,INFO.P.grating_detection_height, [], [0.5 0.5 0.5 0.0]);
    Screen('DrawTexture', myWindow, gabortex, [], [INFO.P.location_left_probes], INFO.P.grating_detection_tilt, [], [], [], [], kPsychDontDoRotation,...
        [INFO.P.grating_detection_phase+180, INFO.P.grating_detection_freq, INFO.P.grating_detection_sc,...
        INFO.P.grating_detection_contrast, INFO.P.grating_detection_aspectratio, 0, 0, 0]);
    Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_rects);
    Screen('Flip', myWindow);

end

if INFO.T(itrial,2).probes == 4
    Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_rects);
    Screen('Flip', myWindow);

end