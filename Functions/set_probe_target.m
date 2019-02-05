% Set the detection probes gabor

if INFO.P. =1
    % Put a grating on the right side and no on the left
    gabortex = CreateProceduralGabor(myWindow, INFO.P.screen.cx+INFO.P.radius*cos(angle_right*pi/180),...
        INFO.P.screen.cy+INFO.P.radius*sin(angle_right*pi/180), [], [0.5 0.5 0.5 0.0]);
    Screen('DrawTexture', myWindow, gabortex, [], [], INFO.P.grating_tilt_tilt, [], [], [], [], kPsychDontDoRotation,...
        [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
        INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
   
    Screen('Flip', myWindow);
end
    
if INFO.P. =2
        % Put a grating on the left side and no on the righ
        gabortex = CreateProceduralGabor(myWindow, INFO.P.screen.cx+INFO.P.radius*cos(angle_tilt_left*pi/180),...
            INFO.P.screen.cy+INFO.P.radius*sin(angle_tilt_left*pi/180), [], [0.5 0.5 0.5 0.0]);
        Screen('DrawTexture', myWindow, gabortex, [], [], INFO.P.grating_tilt_tilt, [], [], [], [], kPsychDontDoRotation,...
            [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
            INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
        
    Screen('Flip', myWindow);
end
    
if INFO.P. =3
            % Put 2 gabors
            gabortex = CreateProceduralGabor(myWindow, INFO.P.screen.cx+INFO.P.radius*cos(angle_right*pi/180),...
                INFO.P.screen.cy+INFO.P.radius*sin(angle_right*pi/180), [], [0.5 0.5 0.5 0.0]);
            Screen('DrawTexture', myWindow, gabortex, [], [], INFO.P.grating_tilt_tilt, [], [], [], [], kPsychDontDoRotation,...
                [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);

            
            gabortex = CreateProceduralGabor(myWindow, INFO.P.screen.cx+INFO.P.radius*cos(angle_right*pi/180),...
                INFO.P.screen.cy+INFO.P.radius*sin(angle_right*pi/180), [], [0.5 0.5 0.5 0.0]);
            Screen('DrawTexture', myWindow, gabortex, [], [], INFO.P.grating_tilt_tilt, [], [], [], [], kPsychDontDoRotation,...
                [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
                INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
            Screen('Flip', myWindow);
end   
                
if INFO.P. =4
    Wait
end