% Set attention target


if INFO.P. =1
% Put a grating on the right side
gabortex = CreateProceduralGabor(myWindow, INFO.P.screen.cx+INFO.P.radius*cos(angle_right*pi/180),...
    INFO.P.screen.cy+INFO.P.radius*sin(angle_right*pi/180), [], [0.5 0.5 0.5 0.0]);
Screen('DrawTexture', myWindow, gabortex, [], [], INFO.P.grating_detection_tilt, [], [], [], [], kPsychDontDoRotation,...
    [INFO.P.grating_detection_phase+180, INFO.P.grating_detection_freq, INFO.P.grating_detection_sc,...
    INFO.P.grating_detection_contrast, INFO.P.grating_detection_aspectratio, 0, 0, 0]);
Screen('Flip', myWindow);

% Put a grating on the left side
gabortex = CreateProceduralGabor(myWindow, INFO.P.screen.cx+INFO.P.radius*cos(angle_left*pi/180),...
    INFO.P.screen.cy+INFO.P.radius*sin(angle_left*pi/180), [], [0.5 0.5 0.5 0.0]);
Screen('DrawTexture', myWindow, gabortex, [], [], INFO.P.grating_detection_tilt, [], [], [], [], kPsychDontDoRotation,...
    [INFO.P.grating_detection_phase+180, INFO.P.grating_detection_freq, INFO.P.grating_detection_sc,...
    INFO.P.grating_detection_contrast, INFO.P.grating_detection_aspectratio, 0, 0, 0]);

Screen('Flip', myWindow);