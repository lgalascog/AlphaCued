function [INFO] = set_questions(myWindow, INFO, itrial)
% Set the questions on the screen


% Question about detection of the noisi gabor
if INFO.T(itrial,5).questions == 1
    Detection_gabor_left = DrawFormattedText(myWindow, INFO.P.text_detection_left, 'center', INFO.P.screen.cy-100, [255, 255, 255, 255]);
    Screen('Flip', myWindow);
    [keyIsDown, timeSecs, keyCode ] = KbCheck;
    keyCode = find(keyCode, 1);
    startSecs = GetSecs;
    
    if keyIsDown
        Reaction_time_gabor_left = timeSecs - startSecs
        %Key_pressed_gabor_left = keyCode
        Report = KbName(keyCode)
    end
    
    KbStrokeWait;
    %INFO.T(itrial,6).button_probes_1 = Report
    
    Detection_gabor_right = DrawFormattedText(myWindow, INFO.P.text_detection_right, 'center', INFO.P.screen.cy-100, [255, 255, 255, 255]);
    Screen('Flip', myWindow);
    [keyIsDown, timeSecs, keyCode ] = KbCheck;
    keyCode = find(keyCode, 1);
    startSecs = GetSecs;
    
    if keyIsDown
        Reaction_time_gabor_right = timeSecs - startSecs
        Report = KbName(keyCode)
   end
    KbStrokeWait;
    
    %INFO.T(itrial,7).button_probes_2 =  Report
    
else % If right before left INFO.T.pre_cue = 2
    Detection_gabor_right = DrawFormattedText(myWindow, INFO.P.text_detection_right, 'center', INFO.P.screen.cy-100, [255, 255, 255, 255]);
    Screen('Flip', myWindow);
    [keyIsDown, timeSecs, keyCode ] = KbCheck;
    keyCode = find(keyCode, 1);
    startSecs = GetSecs;
    
    if keyIsDown
        Reaction_time_gabor_right = timeSecs - startSecs
        Report = KbName(keyCode)
        %Key_pressed_gabor_right = keyCode
    end
    KbStrokeWait;
    %INFO.T(itrial,6).button_probes_1 =  Report
    
    Detection_gabor_left = DrawFormattedText(myWindow, INFO.P.text_detection_left, 'center', INFO.P.screen.cy-100, [255, 255, 255, 255]);
    Screen('Flip', myWindow);
    [keyIsDown, timeSecs, keyCode ] = KbCheck;
    keyCode = find(keyCode, 1);
    startSecs = GetSecs;
    
    if keyIsDown
        Reaction_time_gabor_left = timeSecs - startSecs
        Report = KbName(keyCode)
        %Key_pressed_gabor_left = keyCode
    end
    KbStrokeWait;
    %INFO.T(itrial,7).button_probes_2 = Report
end

% Question for the tilted Gabor
Tilt_gabor = DrawFormattedText(myWindow, INFO.P.text_tilt, 'center', INFO.P.screen.cy-100, [255, 255, 255, 255]);
Screen('Flip', myWindow);
[keyIsDown, timeSecs, keyCode ] = KbCheck;
keyCode = find(keyCode, 1);
startSecs = GetSecs;

if keyIsDown
    Reaction_time_tilt_gabor = timeSecs - startSecs
    Report = KbName(keyCode)
    %Key_pressed_tilt_gabor = keyCode
end
    KbStrokeWait;
    %INFO.T(itrial,8).button_attention = Report
    
    
    