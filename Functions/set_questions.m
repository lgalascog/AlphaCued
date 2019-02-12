function [INFO] = set_questions(myWindow, INFO, itrial)
% Set the questions on the screen


% Question about detection of the noisi gabor
if INFO.T(itrial).questions == 1
    Detection_gabor_left = DrawFormattedText(myWindow, INFO.P.text_detection_left, 'center', INFO.P.screen.cy-100, [255, 255, 255, 255]);
    Screen('Flip', myWindow);
    acceptedKeys = [KbName('y'), KbName('n')];
    %[keyIsDown, timeSecs, keyCode ] = KbCheck;
    %keyCode = find(keyCode, 1);
    startSecs = GetSecs;
    
    responded = 0
    while responded == 0
        [keyIsDown, timeSecs, keyCode ] = KbCheck;
        if any(keyCode(acceptedKeys))
            RT =  timeSecs - startSecs
            Report = str2num(KbName(find(keyCode)));
            responded = 1;
        end
    end
    KbStrokeWait;
    INFO.T(itrial).button_probes_1 = Report
    
    Detection_gabor_right = DrawFormattedText(myWindow, INFO.P.text_detection_right, 'center', INFO.P.screen.cy-100, [255, 255, 255, 255]);
    Screen('Flip', myWindow);
    acceptedKeys = [KbName('y'), KbName('n')];
    %keyCode = find(keyCode, 1);
    startSecs = GetSecs;
    
    responded = 0
    while responded == 0
        [keyIsDown, timeSecs, keyCode ] = KbCheck;
        if any(keyCode(acceptedKeys))
            RT =  timeSecs - startSecs
            Report = str2num(KbName(find(keyCode)));
            responded = 1;
        end
    end
    KbStrokeWait;
    
    INFO.T(itrial).button_probes_2 =  Report
    
else % If right before left INFO.T.pre_cue = 2
    Detection_gabor_right = DrawFormattedText(myWindow, INFO.P.text_detection_right, 'center', INFO.P.screen.cy-100, [255, 255, 255, 255]);
    Screen('Flip', myWindow);
    acceptedKeys = [KbName('y'), KbName('n')];
    %[keyIsDown, timeSecs, keyCode ] = KbCheck;
    %keyCode = find(keyCode, 1);
    startSecs = GetSecs;
    
    responded = 0
    while responded == 0
        [keyIsDown, timeSecs, keyCode ] = KbCheck;
        if any(keyCode(acceptedKeys))
            RT =  timeSecs - startSecs
            Report = str2num(KbName(find(keyCode)));
            responded = 1;
        end
    end
    KbStrokeWait;
    INFO.T(itrial).button_probes_1 =  Report;
    
    Detection_gabor_left = DrawFormattedText(myWindow, INFO.P.text_detection_left, 'center', INFO.P.screen.cy-100, [255, 255, 255, 255]);
    Screen('Flip', myWindow);
    acceptedKeys = [KbName('y'), KbName('n')];
    %[keyIsDown, timeSecs, keyCode ] = KbCheck;
    %keyCode = find(keyCode, 1);
    startSecs = GetSecs;
    
    responded = 0
    while responded == 0
        [keyIsDown, timeSecs, keyCode ] = KbCheck;
        if any(keyCode(acceptedKeys))
            RT =  timeSecs - startSecs
            Report = str2num(KbName(find(keyCode)));
            responded = 1;
        end
    end
    KbStrokeWait;
    INFO.T(itrial).button_probes_2 = Report
end

% Question for the tilted Gabor
Tilt_gabor = DrawFormattedText(myWindow, INFO.P.text_tilt, 'center', INFO.P.screen.cy-100, [255, 255, 255, 255]);
Screen('Flip', myWindow);
acceptedKeys = [KbName('RightArrow'), KbName('LeftArrow')];
%[keyIsDown, timeSecs, keyCode ] = KbCheck;
%keyCode = find(keyCode, 1);
startSecs = GetSecs;

responded = 0
while responded == 0
    [keyIsDown, timeSecs, keyCode ] = KbCheck;
    if any(keyCode(acceptedKeys))
        RT =  timeSecs - startSecs
        Report = str2num(KbName(find(keyCode)));
        responded = 1;
    end
end
KbStrokeWait;
INFO.T(itrial).button_attention = Report


    