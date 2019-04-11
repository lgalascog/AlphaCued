function [INFO] = instruction (INFO)




instructions = DrawFormattedText(myWindow, INFO.P.text_detection_left,...
    'center', INFO.P.screen.cy-100, [255, 255, 255, 255]);
Screen('Flip', myWindow);