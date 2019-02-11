function [INFO] = set_attention_target(myWindow,gabortex,INFO,itrial)
% Set attention target

if INFO.T(itrial,3).attention == 1 %Left and Right clock
    
    
    % Put a grating on the right side
    Screen('DrawTexture', myWindow, gabortex, [], [INFO.P.location_right_attention], INFO.P.grating_tilt_tilt_clock, [], [], [], [], kPsychDontDoRotation,...
        [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
        INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);

    
    
    % Put a grating on the left side
    Screen('DrawTexture', myWindow, gabortex, [], [INFO.P.location_left_attention], INFO.P.grating_tilt_tilt_clock, [], [], [], [], kPsychDontDoRotation,...
        [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
        INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
    Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_rects);
    Screen('Flip', myWindow);
    
    
end

if INFO.T(itrial,3).attention == 2 %Left : clock and Right : cantclock
    
    % Put a grating on the right side
    Screen('DrawTexture', myWindow, gabortex, [], [INFO.P.location_right_attention], INFO.P.grating_tilt_tilt_cantclock, [], [], [], [], kPsychDontDoRotation,...
        [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
        INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
    
    % Put a grating on the left side
    Screen('DrawTexture', myWindow, gabortex, [], [INFO.P.location_left_attention], INFO.P.grating_tilt_tilt_clock, [], [], [], [], kPsychDontDoRotation,...
        [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
        INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
    Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_rects);
    Screen('Flip', myWindow);

    
end

if INFO.T(itrial,3).attention == 3 %Left and Right : cantclock
    
    % Put a grating on the right side
    Screen('DrawTexture', myWindow, gabortex, [], [INFO.P.location_right_attention], INFO.P.grating_tilt_tilt_cantclock, [], [], [], [], kPsychDontDoRotation,...
        [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
        INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
    
    % Put a grating on the left side
    Screen('DrawTexture', myWindow, gabortex, [], [INFO.P.location_left_attention], INFO.P.grating_tilt_tilt_cantclock, [], [], [], [], kPsychDontDoRotation,...
        [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
        INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
    Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_rects);
    Screen('Flip', myWindow);
end

if INFO.T(itrial,3).attention == 4 %Left : cantclock and Right : clock
    
    % Put a grating on the right side
    gabortex = CreateProceduralGabor(myWindow, INFO.P.grating_tilt_width,INFO.P.grating_tilt_height, [], [0.5 0.5 0.5 0.0]);
    Screen('DrawTexture', myWindow, gabortex, [], [INFO.P.location_right_attention], INFO.P.grating_tilt_tilt_clock, [], [], [], [], kPsychDontDoRotation,...
        [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
        INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
    
    % Put a grating on the left side
    gabortex = CreateProceduralGabor(myWindow, INFO.P.grating_tilt_width,INFO.P.grating_tilt_height, [], [0.5 0.5 0.5 0.0]);
    Screen('DrawTexture', myWindow, gabortex, [], [INFO.P.location_left_attention], INFO.P.grating_tilt_tilt_cantclock, [], [], [], [], kPsychDontDoRotation,...
        [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
        INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
    Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_rects);
    Screen('Flip', myWindow);

    
end