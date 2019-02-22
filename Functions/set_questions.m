function [responseKeyRight, responseKeyLeft, responseKeyAttention,RTRight,RTLeft,RTAttention,INFO] = set_questions(myWindow, INFO, itrial)
% Set the questions on the screen

% Question about detection of the noisi gabor
if INFO.T(itrial).questions == 1
    Detection_gabor_left = DrawFormattedText(myWindow, INFO.P.text_detection_left, 'center', INFO.P.screen.cy-100, [255, 255, 255, 255]);
    Screen('Flip', myWindow);
    startSecs1 = GetSecs;
    
    RestrictKeysForKbCheck([KbName('UpArrow'), KbName('DownArrow')]);
    keyIsDown1 = 0;
    while keyIsDown1 == 0
        [keyIsDown1, timeSecs1, keyCode1 ] = KbCheck;
        keyName1 = KbName(keyCode1)
        responseKeyLeft = keyName1
        RTLeft =  timeSecs1 - startSecs1
    end
    WaitSecs(0.5);
    
    Detection_gabor_right = DrawFormattedText(myWindow, INFO.P.text_detection_right, 'center', INFO.P.screen.cy-100, [255, 255, 255, 255]);
    Screen('Flip', myWindow);
    startSecs2 = GetSecs;
    
    RestrictKeysForKbCheck([KbName('UpArrow'), KbName('DownArrow')]);
    keyIsDown2 = 0;
    while keyIsDown2 == 0
        [keyIsDown2, timeSecs2, keyCode2 ] = KbCheck;
        keyName2 = KbName(keyCode2)
        responseKeyRight = keyName2
        RTRight =  timeSecs2 - startSecs2
    end
   
else % If right before left INFO.T.pre_cue = 2
    Detection_gabor_right = DrawFormattedText(myWindow, INFO.P.text_detection_right, 'center', INFO.P.screen.cy-100, [255, 255, 255, 255]);
    Screen('Flip', myWindow);
    startSecs1 = GetSecs;
    RestrictKeysForKbCheck([KbName('UpArrow'), KbName('DownArrow')]);
    keyIsDown1 = 0;
    while keyIsDown1 == 0
        [keyIsDown1, timeSecs1, keyCode1 ] = KbCheck;
        keyName1 = KbName(keyCode1)
        responseKeyRight = keyName1
        RTRight =  timeSecs1 - startSecs1
    end
    
    WaitSecs(0.5);
    Detection_gabor_left = DrawFormattedText(myWindow, INFO.P.text_detection_left, 'center', INFO.P.screen.cy-100, [255, 255, 255, 255]);
    Screen('Flip', myWindow);
    startSecs2 = GetSecs;
    
    RestrictKeysForKbCheck([KbName('UpArrow'), KbName('DownArrow')]);
    keyIsDown2 = 0;
    while keyIsDown2 == 0
        [keyIsDown2, timeSecs2, keyCode2 ] = KbCheck;
        keyName2 = KbName(keyCode2)
        responseKeyLeft = keyName2
        RTLeft =  timeSecs2 - startSecs2
    end
end
WaitSecs(0.5);

% Question for the tilted Gabor
Tilt_gabor = DrawFormattedText(myWindow, INFO.P.text_tilt, 'center', INFO.P.screen.cy-100, [255, 255, 255, 255]);
Screen('Flip', myWindow);
startSecs3 = GetSecs;
RestrictKeysForKbCheck([KbName('RightArrow'), KbName('LeftArrow')]);
keyIsDown3 = 0;

while keyIsDown3 == 0
    [keyIsDown3, timeSecs3, keyCode3 ] = KbCheck;
    keyName3 = KbName(keyCode3)
    responseKeyAttention = keyName3
    RTAttention =  timeSecs3 - startSecs3
end
