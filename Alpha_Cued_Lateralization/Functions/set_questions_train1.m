function [pressedButts,INFO] = set_questions_train1(myWindow, INFO, itrial, isQuit)
% Set the questions on the screen

question1 = DrawFormattedText(myWindow, INFO.P.text_instruction_report_left,...
    'center', INFO.P.screen.cy-500, [255, 255, 255, 255], [],[],[], 2);
question2 = DrawFormattedText(myWindow, INFO.P.text_instruction_report_right,...
    'center', INFO.P.screen.cy-300, [255, 255, 255, 255], [],[],[], 2);
question3 = DrawFormattedText(myWindow, INFO.P.text_instruction_report_tilt,...
    'center', INFO.P.screen.cy-100, [255, 255, 255, 255], [],[],[], 2);
Screen('Flip', myWindow);

Report5 = 0
pressedButts = {};
padnames = {'A', 'B', 'X', 'Y', 'LB', 'RB'};
while Report5 < 3
    [~, timeSecs, keyCode] = KbCheck;
    pressed = button(INFO.P.setup.padh);
    povspressed = pov(INFO.P.setup.padh);
    if any(pressed)
        Report5 = Report5 + 1;
        pressedButts{Report5} = padnames{find(pressed)};
        while any(button(INFO.P.setup.padh)) | pov(INFO.P.setup.padh) ~= -1
            %wait for release
        end
    end
    if pov(INFO.P.setup.padh) ~= -1
        Report5 = Report5 + 1;
        pressedButts{Report5} = povspressed;
        while any(button(INFO.P.setup.padh)) | pov(INFO.P.setup.padh) ~= -1
            %wait for release
        end
    end
end
if keyCode(KbName('Q'))
    isQuit = 1;
    Report = 4
end
if isQuit==1
    CloseAndCleanup(INFO.P)
end
