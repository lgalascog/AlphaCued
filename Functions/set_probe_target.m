function [INFO] = set_probe_target(myWindow,INFO, itrial,gabortex) %,location_right_probes,location_left_probes)
% Set the detection probes gabor

%Probes position
color = INFO.P.stim.background_color + (INFO.T(itrial).Contrast_probes * (255 - INFO.P.stim.background_color(1)));
location_probes_number_right = INFO.T(itrial).probes_position_right;
location_probes_number_left = INFO.T(itrial).probes_position_left;
location_probes_right = INFO.P.position(2,location_probes_number_right,:);
location_probes_left = INFO.P.position(1,location_probes_number_left,:);

%Attention Position
location_attention_number = INFO.T(itrial).attention_position;
location_attention_right = INFO.P.position(2,location_attention_number,:);
location_attention_left = INFO.P.position(1,location_attention_number,:);
rects_right = [location_attention_right(1)-INFO.P.grating_tilt_width_pix/2;...
    location_attention_right(2)-INFO.P.grating_tilt_height_pix/2;...
    location_attention_right(1)+INFO.P.grating_tilt_width_pix/2;....
    location_attention_right(2)+INFO.P.grating_tilt_height_pix/2];
rects_left = [location_attention_left(1)-INFO.P.grating_tilt_width_pix/2;...
    location_attention_left(2)-INFO.P.grating_tilt_height_pix/2;...
    location_attention_left(1)+INFO.P.grating_tilt_width_pix/2;....
    location_attention_left(2)+INFO.P.grating_tilt_height_pix/2];
pre_cue_position = INFO.T(itrial).pre_cue;

if INFO.T(itrial).probes == 1
    Screen('BlendFunction', myWindow, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    Screen('DrawDots', myWindow, [location_probes_right(1) location_probes_right(2)], INFO.P.circle_detection_size_pix, color, [], 2);
    my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,...
        INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color,...
        INFO.P.stim.background_color, INFO.P.screen.pixperdeg)
    
    INFO.T(itrial).Probes_right = 1;
    INFO.T(itrial).Probes_left = 0;
                            
    if pre_cue_position == 1 %Right
        if INFO.T(itrial).validity == 1 %Right
            if INFO.T(itrial).orientation == 1 %Clock
                Screen('DrawTexture', myWindow, gabortex, [], [rects_right],...
                    -rad2deg(INFO.T(itrial).Contrast_attention), [], [], [], [], kPsychDontDoRotation,...
                    [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                    INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
                
            elseif INFO.T(itrial).orientation == 2 %Cantclock
                Screen('DrawTexture', myWindow, gabortex, [], [rects_right],...
                    rad2deg(INFO.T(itrial).Contrast_attention), [], [], [], [], kPsychDontDoRotation,...
                    [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                    INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
                
            end
        elseif INFO.T(itrial).validity == 2 %Left
            if INFO.T(itrial).orientation == 1 %Clock
                Screen('DrawTexture', myWindow, gabortex, [], [rects_left],...
                    -rad2deg(INFO.T(itrial).Contrast_attention), [], [], [], [], kPsychDontDoRotation,...
                    [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                    INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
                
            elseif INFO.T(itrial).orientation == 2 %Cantclock
                Screen('DrawTexture', myWindow, gabortex, [], [rects_left],...
                    rad2deg(INFO.T(itrial).Contrast_attention), [], [], [], [], kPsychDontDoRotation,...
                    [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                    INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
                
            end
        end
    end
    
    if pre_cue_position == 2 %Left
        if INFO.T(itrial).validity == 1 %Left
            if INFO.T(itrial).orientation == 1 %Clock
                Screen('DrawTexture', myWindow, gabortex, [], [rects_left],...
                    -rad2deg(INFO.T(itrial).Contrast_attention), [], [], [], [], kPsychDontDoRotation,...
                    [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                    INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
                
            elseif INFO.T(itrial).orientation == 2 %Cantclock
                Screen('DrawTexture', myWindow, gabortex, [], [rects_left],...
                    rad2deg(INFO.T(itrial).Contrast_attention), [], [], [], [], kPsychDontDoRotation,...
                    [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                    INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
                
            end
        elseif INFO.T(itrial).validity == 2 %Right
            if INFO.T(itrial).orientation == 1 %Clock
                Screen('DrawTexture', myWindow, gabortex, [], [rects_right],...
                    -rad2deg(INFO.T(itrial).Contrast_attention), [], [], [], [], kPsychDontDoRotation,...
                    [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                    INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
                
            elseif INFO.T(itrial).orientation == 2 %Cantclock
                Screen('DrawTexture', myWindow, gabortex, [], [rects_right],...
                    rad2deg(INFO.T(itrial).Contrast_attention), [], [], [], [], kPsychDontDoRotation,...
                    [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                    INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
                
            end
        end
    end
elseif INFO.T(itrial).probes == 2
    Screen('BlendFunction', myWindow, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    Screen('DrawDots', myWindow, [location_probes_left(1) location_probes_left(2)], INFO.P.circle_detection_size_pix, color, [], 2);
    my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,... 
        INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color,... 
        INFO.P.stim.background_color, INFO.P.screen.pixperdeg)
    
    INFO.T(itrial).Probes_right = 0;
    INFO.T(itrial).Probes_left = 1;
    
    if pre_cue_position == 1 %Right
        if INFO.T(itrial).validity == 1 %Right
            if INFO.T(itrial).orientation == 1 %Clock
                Screen('DrawTexture', myWindow, gabortex, [], [rects_right],...
                    -rad2deg(INFO.T(itrial).Contrast_attention), [], [], [], [], kPsychDontDoRotation,...
                    [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                    INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
                
            elseif INFO.T(itrial).orientation == 2 %Cantclock
                Screen('DrawTexture', myWindow, gabortex, [], [rects_right],...
                    rad2deg(INFO.T(itrial).Contrast_attention), [], [], [], [], kPsychDontDoRotation,...
                    [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                    INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
                
            end
        elseif INFO.T(itrial).validity == 2 %Left
            if INFO.T(itrial).orientation == 1 %Clock
                Screen('DrawTexture', myWindow, gabortex, [], [rects_left],...
                    -rad2deg(INFO.T(itrial).Contrast_attention), [], [], [], [], kPsychDontDoRotation,...
                    [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                    INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
                
            elseif INFO.T(itrial).orientation == 2 %Cantclock
                Screen('DrawTexture', myWindow, gabortex, [], [rects_left],...
                    rad2deg(INFO.T(itrial).Contrast_attention), [], [], [], [], kPsychDontDoRotation,...
                    [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                    INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
                
            end
        end
    end
    
    if pre_cue_position == 2 %Left
        if INFO.T(itrial).validity == 1 %Left
            if INFO.T(itrial).orientation == 1 %Clock
                Screen('DrawTexture', myWindow, gabortex, [], [rects_left],...
                    -rad2deg(INFO.T(itrial).Contrast_attention), [], [], [], [], kPsychDontDoRotation,...
                    [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                    INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
                
            elseif INFO.T(itrial).orientation == 2 %Cantclock
                Screen('DrawTexture', myWindow, gabortex, [], [rects_left],...
                    rad2deg(INFO.T(itrial).Contrast_attention), [], [], [], [], kPsychDontDoRotation,...
                    [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                    INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
                
            end
        elseif INFO.T(itrial).validity == 2 %Right
            if INFO.T(itrial).orientation == 1 %Clock
                Screen('DrawTexture', myWindow, gabortex, [], [rects_right],...
                    -rad2deg(INFO.T(itrial).Contrast_attention), [], [], [], [], kPsychDontDoRotation,...
                    [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                    INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
                
            elseif INFO.T(itrial).orientation == 2 %Cantclock
                Screen('DrawTexture', myWindow, gabortex, [], [rects_right],...
                    rad2deg(INFO.T(itrial).Contrast_attention), [], [], [], [], kPsychDontDoRotation,...
                    [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                    INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
                
            end
        end
    end

elseif INFO.T(itrial).probes == 3
    Screen('BlendFunction', myWindow, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    Screen('DrawDots', myWindow, [location_probes_right(1) location_probes_right(2)], INFO.P.circle_detection_size_pix, color, [], 2);
    
    Screen('DrawDots', myWindow, [location_probes_left(1) location_probes_left(2)], INFO.P.circle_detection_size_pix, color, [], 2);
    my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,...
        INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color,...
        INFO.P.stim.background_color, INFO.P.screen.pixperdeg)
    
    INFO.T(itrial).Probes_right = 1;
    INFO.T(itrial).Probes_left = 1;
    
        if pre_cue_position == 1 %Right
        if INFO.T(itrial).validity == 1 %Right
            if INFO.T(itrial).orientation == 1 %Clock
                Screen('DrawTexture', myWindow, gabortex, [], [rects_right],...
                    -rad2deg(INFO.T(itrial).Contrast_attention), [], [], [], [], kPsychDontDoRotation,...
                    [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                    INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
                
            elseif INFO.T(itrial).orientation == 2 %Cantclock
                Screen('DrawTexture', myWindow, gabortex, [], [rects_right],...
                    rad2deg(INFO.T(itrial).Contrast_attention), [], [], [], [], kPsychDontDoRotation,...
                    [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                    INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
                
            end
        elseif INFO.T(itrial).validity == 2 %Left
            if INFO.T(itrial).orientation == 1 %Clock
                Screen('DrawTexture', myWindow, gabortex, [], [rects_left],...
                    -rad2deg(INFO.T(itrial).Contrast_attention), [], [], [], [], kPsychDontDoRotation,...
                    [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                    INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
                
            elseif INFO.T(itrial).orientation == 2 %Cantclock
                Screen('DrawTexture', myWindow, gabortex, [], [rects_left],...
                    rad2deg(INFO.T(itrial).Contrast_attention), [], [], [], [], kPsychDontDoRotation,...
                    [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                    INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
                
            end
        end
    end
    
    if pre_cue_position == 2 %Left
        if INFO.T(itrial).validity == 1 %Left
            if INFO.T(itrial).orientation == 1 %Clock
                Screen('DrawTexture', myWindow, gabortex, [], [rects_left],...
                    -rad2deg(INFO.T(itrial).Contrast_attention), [], [], [], [], kPsychDontDoRotation,...
                    [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                    INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
                
            elseif INFO.T(itrial).orientation == 2 %Cantclock
                Screen('DrawTexture', myWindow, gabortex, [], [rects_left],...
                    rad2deg(INFO.T(itrial).Contrast_attention), [], [], [], [], kPsychDontDoRotation,...
                    [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                    INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
                
            end
        elseif INFO.T(itrial).validity == 2 %Right
            if INFO.T(itrial).orientation == 1 %Clock
                Screen('DrawTexture', myWindow, gabortex, [], [rects_right],...
                    -rad2deg(INFO.T(itrial).Contrast_attention), [], [], [], [], kPsychDontDoRotation,...
                    [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                    INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
                
            elseif INFO.T(itrial).orientation == 2 %Cantclock
                Screen('DrawTexture', myWindow, gabortex, [], [rects_right],...
                    rad2deg(INFO.T(itrial).Contrast_attention), [], [], [], [], kPsychDontDoRotation,...
                    [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                    INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
                
            end
        end
    end
elseif INFO.T(itrial).probes == 4
    my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,...
        INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color,...
        INFO.P.stim.background_color, INFO.P.screen.pixperdeg)
        
    INFO.T(itrial).Probes_right = 0;
    INFO.T(itrial).Probes_left = 0;
    
    
    if pre_cue_position == 1 %Right
        if INFO.T(itrial).validity == 1 %Right
            if INFO.T(itrial).orientation == 1 %Clock
                Screen('DrawTexture', myWindow, gabortex, [], [rects_right],...
                    -rad2deg(INFO.T(itrial).Contrast_attention), [], [], [], [], kPsychDontDoRotation,...
                    [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                    INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
                
            elseif INFO.T(itrial).orientation == 2 %Cantclock
                Screen('DrawTexture', myWindow, gabortex, [], [rects_right],...
                    rad2deg(INFO.T(itrial).Contrast_attention), [], [], [], [], kPsychDontDoRotation,...
                    [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                    INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
                
            end
        elseif INFO.T(itrial).validity == 2 %Left
            if INFO.T(itrial).orientation == 1 %Clock
                Screen('DrawTexture', myWindow, gabortex, [], [rects_left],...
                    -rad2deg(INFO.T(itrial).Contrast_attention), [], [], [], [], kPsychDontDoRotation,...
                    [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                    INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
                
            elseif INFO.T(itrial).orientation == 2 %Cantclock
                Screen('DrawTexture', myWindow, gabortex, [], [rects_left],...
                    rad2deg(INFO.T(itrial).Contrast_attention), [], [], [], [], kPsychDontDoRotation,...
                    [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                    INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
                
            end
        end
    end
    
    if pre_cue_position == 2 %Left
        if INFO.T(itrial).validity == 1 %Left
            if INFO.T(itrial).orientation == 1 %Clock
                Screen('DrawTexture', myWindow, gabortex, [], [rects_left],...
                    -rad2deg(INFO.T(itrial).Contrast_attention), [], [], [], [], kPsychDontDoRotation,...
                    [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                    INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
                
            elseif INFO.T(itrial).orientation == 2 %Cantclock
                Screen('DrawTexture', myWindow, gabortex, [], [rects_left],...
                    rad2deg(INFO.T(itrial).Contrast_attention), [], [], [], [], kPsychDontDoRotation,...
                    [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                    INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
                
            end
        elseif INFO.T(itrial).validity == 2 %Right
            if INFO.T(itrial).orientation == 1 %Clock
                Screen('DrawTexture', myWindow, gabortex, [], [rects_right],...
                    -rad2deg(INFO.T(itrial).Contrast_attention), [], [], [], [], kPsychDontDoRotation,...
                    [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                    INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
                
            elseif INFO.T(itrial).orientation == 2 %Cantclock
                Screen('DrawTexture', myWindow, gabortex, [], [rects_right],...
                    rad2deg(INFO.T(itrial).Contrast_attention), [], [], [], [], kPsychDontDoRotation,...
                    [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                    INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
                
            end
        end
    end
end
% Screen('Flip', myWindow);
Screen('DrawingFinished', myWindow);