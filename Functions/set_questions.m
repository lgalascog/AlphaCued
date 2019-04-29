function [pressedButts,INFO] = set_questions(myWindow, INFO, itrial, isQuit)
% Set the questions on the screen

% Question about detection of the noisi gabor
Detection_gabor_left = DrawFormattedText(myWindow, INFO.P.text_questions,...
    'center', INFO.P.screen.cy, [255, 255, 255, 255]);
Screen('Flip', myWindow);
Report = 0
pressedButts = {};
padnames = {'A', 'B', 'X', 'Y', 'LB', 'RB'};
while Report < 3    
    if button(INFO.P.setup.padh,8) == 1
        CloseAndCleanup(INFO.P)
    end
    [~, timeSecs, keyCode] = KbCheck;
    pressed = button(INFO.P.setup.padh);
    povspressed = pov(INFO.P.setup.padh);
    if any(pressed)
        Report = Report + 1;
        pressedButts{Report} = padnames{find(pressed)};
        while any(button(INFO.P.setup.padh)) | pov(INFO.P.setup.padh) ~= -1
            %wait for release
        end
    end
    if pov(INFO.P.setup.padh) ~= -1
        Report = Report + 1;
        pressedButts{Report} = povspressed;
        while any(button(INFO.P.setup.padh)) | pov(INFO.P.setup.padh) ~= -1
            %wait for release
        end
    end
end
    