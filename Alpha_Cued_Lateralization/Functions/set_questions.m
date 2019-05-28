
function [pressedButts, INFO, isQuit, joy] = set_questions(myWindow, INFO, isQuit,joy)
% Set the questions on the screen
%joy = HebiJoystick(1);


% Question about detection of the noisi gabor
Detection_gabor_left = DrawFormattedText(myWindow, INFO.P.text_questions,...
    'center', INFO.P.screen.cy, [255, 255, 255, 255]);
Screen('Flip', myWindow);
Report = 0;
pressedButts = {};
padnames = {'X', 'A', 'B', 'Y', 'LB', 'RB'};
% Office: padnames = {'A', 'B', 'X', 'Y', 'LB', 'RB'};
while Report < 3    
%     [~, timeSecs, keyCode] = KbCheck;
    pressed = button(joy);
    povspressed = pov(joy);
%     axes = read(joy);
    if any(pressed)
        Report = Report + 1;
        pressedButts{Report} = padnames{find(pressed)};
        while any(button(joy)) | pov(joy) ~= -1
            %wait for release
        end
    end
    if pov(joy) ~= -1   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% if hebijoystick
        Report = Report + 1;
        pressedButts{Report} = povspressed;
        while any(button(joy)) | pov(joy) ~= -1
            %wait for release
        end
    end
    
%     if axes(6) ~= 0   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% if vrjoystick
%         Report = Report + 1;
%         pressedButts{Report} = axes;
%         while any(button(joy)) | read(joy) ~= -1
%             %wait for release
%         end
%     end
    
    [keyIsDown,secs,keyCode] = KbCheck;
    if keyIsDown
        if keyCode(INFO.P.keys.esc)
             isQuit = 1;
             Report = 99;
        end
    end
end
    