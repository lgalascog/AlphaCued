function [INFO] = set_attention_target(myWindow,gabortex,INFO,itrial)
% Set attention target

%INFO.T(itrial).Contrast_attention*100

%Angle_quest = INFO.T(itrial).Gabor_angle + (INFO.T(itrial).Contrast_attention * (45 - INFO.T(itrial).Gabor_angle)); %INFO.P.grating_tilt_tilt_clock + INFO.T(itrial).Contrast_attention * 45 
Angle_quest = INFO.T(itrial).Contrast_attention * 45


pre_cue_position = INFO.T(itrial).pre_cue

if pre_cue_position == 1
    if INFO.T(itrial).attention == 1 % Gabor Left, clock
        Screen('DrawTexture', myWindow, gabortex, [], [INFO.P.location_left_attention], INFO.P.grating_tilt_tilt_clock-Angle_quest, [], [], [], [], kPsychDontDoRotation,...
            [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
            INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
        my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy, INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color, INFO.P.stim.background_color, INFO.P.screen.pixperdeg)
        Screen('Flip', myWindow);
        
    elseif INFO.T(itrial).attention == 2 % Gabor Left, cantclock
        Screen('DrawTexture', myWindow, gabortex, [], [INFO.P.location_left_attention], INFO.P.grating_tilt_tilt_cantclock+Angle_quest, [], [], [], [], kPsychDontDoRotation,...
            [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
            INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
        my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy, INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color, INFO.P.stim.background_color, INFO.P.screen.pixperdeg)
        Screen('Flip', myWindow);
        
    elseif INFO.T(itrial).attention == 3 % Gabor Right, clock
        Screen('DrawTexture', myWindow, gabortex, [], [INFO.P.location_right_attention], INFO.P.grating_tilt_tilt_clock-Angle_quest, [], [], [], [], kPsychDontDoRotation,...
            [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
            INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
        my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy, INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color, INFO.P.stim.background_color, INFO.P.screen.pixperdeg)
        Screen('Flip', myWindow);
        
    elseif INFO.T(itrial).attention == 4 % Gabor Right, cantclock
        Screen('DrawTexture', myWindow, gabortex, [], [INFO.P.location_right_attention], INFO.P.grating_tilt_tilt_cantclock+Angle_quest, [], [], [], [], kPsychDontDoRotation,...
            [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
            INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
        my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy, INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color, INFO.P.stim.background_color, INFO.P.screen.pixperdeg)
        Screen('Flip', myWindow);
    end
end

if pre_cue_position == 2
    if INFO.T(itrial).attention == 1 % Gabor Right, clock
        Screen('DrawTexture', myWindow, gabortex, [], [INFO.P.location_right_attention], INFO.P.grating_tilt_tilt_clock-Angle_quest, [], [], [], [], kPsychDontDoRotation,...
            [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
            INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
        my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy, INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color, INFO.P.stim.background_color, INFO.P.screen.pixperdeg)
        Screen('Flip', myWindow);
        
    elseif INFO.T(itrial).attention == 2 % Gabor Right, cantclock
        Screen('DrawTexture', myWindow, gabortex, [], [INFO.P.location_right_attention], INFO.P.grating_tilt_tilt_cantclock+Angle_quest, [], [], [], [], kPsychDontDoRotation,...
            [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
            INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
        my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy, INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color, INFO.P.stim.background_color, INFO.P.screen.pixperdeg)
        Screen('Flip', myWindow);
        
    elseif INFO.T(itrial).attention == 3 % Gabor Left, clock
        Screen('DrawTexture', myWindow, gabortex, [], [INFO.P.location_left_attention], INFO.P.grating_tilt_tilt_clock-Angle_quest, [], [], [], [], kPsychDontDoRotation,...
            [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
            INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
        my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy, INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color, INFO.P.stim.background_color, INFO.P.screen.pixperdeg)
        Screen('Flip', myWindow);
        
    elseif INFO.T(itrial).attention == 4 % Gabor Left, cantclock
        Screen('DrawTexture', myWindow, gabortex, [], [INFO.P.location_left_attention], INFO.P.grating_tilt_tilt_cantclock+Angle_quest, [], [], [], [], kPsychDontDoRotation,...
            [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
            INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
        my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy, INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color, INFO.P.stim.background_color, INFO.P.screen.pixperdeg)
        Screen('Flip', myWindow);
    end
end


% if INFO.T(itrial).attention == 1 %Left and Right clock
%     
%     
%     % Put a grating on the right side
%     Screen('DrawTexture', myWindow, gabortex, [], [INFO.P.location_right_attention], INFO.P.grating_tilt_tilt_clock, [], [], [], [], kPsychDontDoRotation,...
%         [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
%         INFO.T(itrial).Contrast_attention*100, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
% 
%     
%     
%     % Put a grating on the left side
%     Screen('DrawTexture', myWindow, gabortex, [], [INFO.P.location_left_attention], INFO.P.grating_tilt_tilt_clock, [], [], [], [], kPsychDontDoRotation,...
%         [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
%         INFO.T(itrial).Contrast_attention*100, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
%     Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_rects);
%     Screen('Flip', myWindow);
%     
%     
% end
% 
% if INFO.T(itrial).attention == 2 %Left : clock and Right : cantclock
%     
%     % Put a grating on the right side
%     Screen('DrawTexture', myWindow, gabortex, [], [INFO.P.location_right_attention], INFO.P.grating_tilt_tilt_cantclock, [], [], [], [], kPsychDontDoRotation,...
%         [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
%         INFO.T(itrial).Contrast_attention*100, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
%     
%     % Put a grating on the left side
%     Screen('DrawTexture', myWindow, gabortex, [], [INFO.P.location_left_attention], INFO.P.grating_tilt_tilt_clock, [], [], [], [], kPsychDontDoRotation,...
%         [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
%         INFO.T(itrial).Contrast_attention*100, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
%     Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_rects);
%     Screen('Flip', myWindow);
% 
%     
% end
% 
% if INFO.T(itrial).attention == 3 %Left and Right : cantclock
%     
%     % Put a grating on the right side
%     Screen('DrawTexture', myWindow, gabortex, [], [INFO.P.location_right_attention], INFO.P.grating_tilt_tilt_cantclock, [], [], [], [], kPsychDontDoRotation,...
%         [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
%         INFO.T(itrial).Contrast_attention*100, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
%     
%     % Put a grating on the left side
%     Screen('DrawTexture', myWindow, gabortex, [], [INFO.P.location_left_attention], INFO.P.grating_tilt_tilt_cantclock, [], [], [], [], kPsychDontDoRotation,...
%         [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
%         INFO.T(itrial).Contrast_attention*100, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
%     Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_rects);
%     Screen('Flip', myWindow);
% end
% 
% if INFO.T(itrial).attention == 4 %Left : cantclock and Right : clock
%     
%     % Put a grating on the right side
%     gabortex = CreateProceduralGabor(myWindow, INFO.P.grating_tilt_width,INFO.P.grating_tilt_height, [], [0.5 0.5 0.5 0.0]);
%     Screen('DrawTexture', myWindow, gabortex, [], [INFO.P.location_right_attention], INFO.P.grating_tilt_tilt_clock, [], [], [], [], kPsychDontDoRotation,...
%         [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
%         INFO.T(itrial).Contrast_attention*100, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
%     
%     % Put a grating on the left side
%     gabortex = CreateProceduralGabor(myWindow, INFO.P.grating_tilt_width,INFO.P.grating_tilt_height, [], [0.5 0.5 0.5 0.0]);
%     Screen('DrawTexture', myWindow, gabortex, [], [INFO.P.location_left_attention], INFO.P.grating_tilt_tilt_cantclock, [], [], [], [], kPsychDontDoRotation,...
%         [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
%         INFO.T(itrial).Contrast_attention*100, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
%     Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_rects);
%     Screen('Flip', myWindow);
% 
%     
% end