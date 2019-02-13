function [responseKey1, responseKey2, responseKey3,RT1,RT2,RT3,INFO] = set_questions(myWindow, INFO, itrial)
% Set the questions on the screen
T = INFO.T(itrial);

% Question about detection of the noisi gabor
if INFO.T(itrial).questions == 1
    Detection_gabor_left = DrawFormattedText(myWindow, INFO.P.text_detection_left, 'center', INFO.P.screen.cy-100, [255, 255, 255, 255]);
    Screen('Flip', myWindow);
    acceptedKeys = [KbName('y'), KbName('n')];
    %[keyIsDown, timeSecs, keyCode ] = KbCheck;
    %keyCode = find(keyCode, 1);
    startSecs1 = GetSecs;
    
    responded = 0
    while responded == 0
        [keyIsDown1, timeSecs1, keyCode1 ] = KbCheck; 
        keyName = KbName(keyCode1)
        if any(keyCode1(acceptedKeys))
            responseKey1 = keyName(1)
            RT1 =  timeSecs1 - startSecs1
            %Report = str2num(KbName(find(keyCode1)));
            responded = 1;
        end
    end
    %KbStrokeWait;
    T.button_probes_1 = responseKey1
    T.RT_1 = RT1
    Detection_gabor_right = DrawFormattedText(myWindow, INFO.P.text_detection_right, 'center', INFO.P.screen.cy-100, [255, 255, 255, 255]);
    Screen('Flip', myWindow);
    %acceptedKeys2 = [KbName('o'), KbName('p')];
    %keyCode = find(keyCode, 1);
    startSecs2 = GetSecs;
    
    responded_2 = 0
    while responded_2 == 0
        [keyIsDown2, timeSecs2, keyCode2 ] = KbCheck;
        keyName = KbName(keyCode2)
        if any(keyCode2(acceptedKeys))
            responseKey2 = keyName(1)
            RT2 =  timeSecs2 - startSecs2
            %Report = str2num(KbName(find(keyCode2)));
            responded_2 = 1;
        end
    end
    KbStrokeWait;
    
    T.button_probes_2 =  responseKey2
    T.RT_2 = RT2
    
else % If right before left INFO.T.pre_cue = 2
    Detection_gabor_right = DrawFormattedText(myWindow, INFO.P.text_detection_right, 'center', INFO.P.screen.cy-100, [255, 255, 255, 255]);
    Screen('Flip', myWindow);
    acceptedKeys = [KbName('y'), KbName('n')];
    %[keyIsDown, timeSecs, keyCode ] = KbCheck;
    %keyCode = find(keyCode, 1);
    startSecs1 = GetSecs;
    
    responded = 0
    while responded == 0
        [keyIsDown1, timeSecs1, keyCode1 ] = KbCheck;
        keyName = KbName(keyCode1)
        if any(keyCode1(acceptedKeys))
            responseKey1 = keyName(1)
            RT1 =  timeSecs1 - startSecs1
            %Report = str2num(KbName(find(keyCode1)));
            responded = 1;
        end
    end
    %KbStrokeWait;
    T.button_probes_1 =  responseKey1;
    T.RT_1 = RT1
    
    Detection_gabor_left = DrawFormattedText(myWindow, INFO.P.text_detection_left, 'center', INFO.P.screen.cy-100, [255, 255, 255, 255]);
    Screen('Flip', myWindow);
    %acceptedKeys2 = [KbName('o'), KbName('p')];
    %[keyIsDown, timeSecs, keyCode ] = KbCheck;
    %keyCode = find(keyCode, 1);
    startSecs2 = GetSecs;
    
    responded_2 = 0
    while responded_2 == 0
        [keyIsDown2, timeSecs2, keyCode2 ] = KbCheck;
        keyName = KbName(keyCode2)
        if any(keyCode2(acceptedKeys))
            responseKey2 = keyName(1)
            RT2 =  timeSecs2 - startSecs2
            %Report = str2num(KbName(find(keyCode2)));
            responded_2 = 1;
        end
    end
    KbStrokeWait;
    T.button_probes_2 = responseKey2
    T.RT_2 = RT2

end

% Question for the tilted Gabor
Tilt_gabor = DrawFormattedText(myWindow, INFO.P.text_tilt, 'center', INFO.P.screen.cy-100, [255, 255, 255, 255]);
Screen('Flip', myWindow);
acceptedKeys3 = [KbName('RightArrow'), KbName('LeftArrow')];
%[keyIsDown, timeSecs, keyCode ] = KbCheck;
%keyCode = find(keyCode, 1);
startSecs3 = GetSecs;

responded_3 = 0
while responded_3 == 0
    [keyIsDown3, timeSecs3, keyCode3 ] = KbCheck;
    keyName = KbName(keyCode3)
    if any(keyCode3(acceptedKeys3))
        responseKey3 = keyName(1)
        RT3 =  timeSecs3 - startSecs3
        %Report = str2num(KbName(find(keyCode3)));
        responded_3 = 1;
    end
end
%KbStrokeWait;
T.button_attention = responseKey3
T.RT_3 = RT3
    