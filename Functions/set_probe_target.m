function [INFO] = set_probe_target(myWindow,gabortex,INFO, itrial) %,location_right_probes,location_left_probes)
% Set the detection probes gabor
color = [128+INFO.T(itrial).Contrast_probes*100 128+INFO.T(itrial).Contrast_probes*100 128+INFO.T(itrial).Contrast_probes*100]

if INFO.T(itrial).probes == 1
    % Put a grating on the right side and no on the left
    %     Screen('DrawTexture', myWindow, gabortex, [], [INFO.P.location_right_probes], [INFO.P.grating_detection_tilt], [], [], [], [], kPsychDontDoRotation,...
    %         [INFO.P.grating_detection_phase+180, INFO.P.grating_detection_freq, INFO.P.grating_detection_sc,...
    %         INFO.P.grating_detection_contrast, INFO.P.grating_detection_aspectratio, 0, 0, 0]);
    Screen('FrameOval', myWindow , color, [INFO.P.location_right_probes], 5,5);
    Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_rects);
    Screen('Flip', myWindow);

end

if INFO.T(itrial).probes == 2
    % Put a grating on the left side and no on the righ
%     Screen('DrawTexture', myWindow, gabortex, [], [INFO.P.location_left_probes], INFO.P.grating_detection_tilt, [], [], [], [], kPsychDontDoRotation,...
%         [INFO.P.grating_detection_phase+180, INFO.P.grating_detection_freq, INFO.P.grating_detection_sc,...
%         INFO.P.grating_detection_contrast, INFO.P.grating_detection_aspectratio, 0, 0, 0]);
    Screen('FrameOval', myWindow , color, [INFO.P.location_left_probes], 5,5);
    Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_rects);
    Screen('Flip', myWindow);

end

if INFO.T(itrial).probes == 3
    % Put 2 gabors
%     Screen('DrawTexture', myWindow, gabortex, [], [INFO.P.location_right_probes], INFO.P.grating_detection_tilt, [], [], [], [], kPsychDontDoRotation,...
%         [INFO.P.grating_detection_phase+180, INFO.P.grating_detection_freq, INFO.P.grating_detection_sc,...
%         INFO.P.grating_detection_contrast, INFO.P.grating_detection_aspectratio, 0, 0, 0]);
        Screen('FrameOval', myWindow , color, [INFO.P.location_right_probes], 5,5);
    
%     Screen('DrawTexture', myWindow, gabortex, [], [INFO.P.location_left_probes], INFO.P.grating_detection_tilt, [], [], [], [], kPsychDontDoRotation,...
%         [INFO.P.grating_detection_phase+180, INFO.P.grating_detection_freq, INFO.P.grating_detection_sc,...
%         INFO.P.grating_detection_contrast, INFO.P.grating_detection_aspectratio, 0, 0, 0]);
      Screen('FrameOval', myWindow , color, [INFO.P.location_left_probes], 5,5);
    Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_rects);
    Screen('Flip', myWindow);

end

if INFO.T(itrial).probes == 4
    Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_rects);
    Screen('Flip', myWindow);

end