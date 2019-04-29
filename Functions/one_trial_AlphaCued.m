function [INFO, isQuit] = one_trial_AlphaCued(myWindow, INFO, itrial)


isQuit=0;
% Run one trial

% Recalibration
if INFO.P.setup.isEYEtrack && itrial~=1; %
    EyelinkRecalibration(P);
    Eyelink('Message', 'SYNCTIME');
end

if INFO.P.setup.isEYEtrack
    Eyelink('Message', 'TrialID %d', itrial);
end

EyeHasMoved = 0;
EyeIsLost = 0;
% put last trial at end of block and note that something was
% wrong
if INFO.P.setup.isEYEtrack
    if EyeHasMoved == 1 || EyeIsLost == 1
        INFO.T.GazeHasMovedOrEyeIsLost = 1;
        EyeHasMoved = 0;
        EyeIsLost = 0;
    end
end

% --------------------------------------------------------
% Prestimulus interval
% --------------------------------------------------------
my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,... 
   INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color,...
   INFO.P.stim.background_color, INFO.P.screen.pixperdeg);
Screen('Flip', myWindow);
WaitSecs(INFO.P.paradigm_blank);


% --------------------------------------------------------
% Precue
% --------------------------------------------------------
set_pre_cue(myWindow,INFO, itrial);
WaitSecs(INFO.P.paradigm_precue);

% send trigger to EEG
if INFO.P.setup.isEYEtrack
    EyeLinkMessage = 'Cue';
    Eyelink('Message', EyeLinkMessage, itrial);
    Trigger  = 10 + INFO.T(itrial).pre_cue;
    SendTrigger(Trigger, P.TriggerDuration);
    % check if gaze position is within boudaries
    [~,~,EyeHasMoved] = EyelinkGetGaze(P,1);
end

% --------------------------------------------------------
% Delay
% --------------------------------------------------------
my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,...
   INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color,...
   INFO.P.stim.background_color,  INFO.P.screen.pixperdeg);
Screen('Flip', myWindow);
WaitSecs(INFO.P.paradigm_delay_between_cue_and_stim);

% --------------------------------------------------------
% Stimuli
% --------------------------------------------------------
gabortex = CreateProceduralGabor(myWindow, INFO.P.grating_tilt_width_pix,...
INFO.P.grating_tilt_height_pix, [], [0.5 0.5 0.5 0.0]);
[INFO] = set_probe_target(myWindow,INFO,itrial,gabortex);
WaitSecs(INFO.P.paradigm_stim);


if INFO.T(itrial).probes == 1
    Trigger2 = 22;
    Trigger3 = 31;
end
if INFO.T(itrial).probes == 2
    Trigger2 = 21;
    Trigger3 = 32;
end
if INFO.T(itrial).probes == 3
    Trigger2 = 21;
    Trigger3 = 31;
end
if INFO.T(itrial).probes == 4
    Trigger2 = 22;
    Trigger3 = 32;
end

% send trigger to EEG
if INFO.P.setup.isEYEtrack
    EyeLinkMessage = 'Probes ';
    Eyelink('Message', EyeLinkMessage, itrial);
    SendTrigger(Trigger2, P.TriggerDuration);
    SendTrigger(Trigger3, P.TriggerDuration);
end


% --------------------------------------------------------
% delay
% --------------------------------------------------------
my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,...
    INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color,...
    INFO.P.stim.background_color, INFO.P.screen.pixperdeg);
Screen('Flip', myWindow);
WaitSecs(INFO.P.paradigm_delay_before_question);

% --------------------------------------------------------
% questions
% --------------------------------------------------------
[pressedButts, INFO] = set_questions(myWindow, INFO, itrial, isQuit);

INFO.T(itrial).button_pressed = pressedButts;


if find([pressedButts{:}] == 0);
    INFO.T(itrial).button_probes_left = 'U'; %left up pressed
elseif find([pressedButts{:}] == 180);
    INFO.T(itrial).button_probes_left = 'D'; %left down pressed
else
    INFO.T(itrial).button_probes_left = 'N';
end

if find(strcmp(pressedButts,'Y' ));
    INFO.T(itrial).button_probes_right = 'U'; %right up pressed
elseif find(strcmp(pressedButts,'A' ));
    INFO.T(itrial).button_probes_right = 'D'; %right down pressed
else
    INFO.T(itrial).button_probes_right = 'N';
end

if find(strcmp(pressedButts,'RB' ));
    INFO.T(itrial).button_attention = 'R'; %Tilted to the right
elseif find(strcmp(pressedButts,'LB' ));
    INFO.T(itrial).button_attention = 'L'; %Tilted to the left
else
    INFO.T(itrial).button_attention = 'N';
end


[INFO, Correct_probes_right,Correct_probes_left, Correct_attention] = response_validity (INFO, itrial);
INFO.T(itrial).Correct_probes_right = Correct_probes_right;
INFO.T(itrial).Correct_probes_left = Correct_probes_left;
INFO.T(itrial).Correct_attention = Correct_attention;

% --------------------------------------------------------
% Color feedback
% --------------------------------------------------------
color_feedback(myWindow, INFO, itrial);
WaitSecs(INFO.P.paradigm_ITI/2);

% --------------------------------------------------------
% End of the trial
% --------------------------------------------------------
my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,...
    INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color,...
    INFO.P.stim.background_color, INFO.P.screen.pixperdeg);
Screen('Flip', myWindow);
WaitSecs(INFO.P.paradigm_ITI/2);

if EyeIsLost ==1
    EyelinkRecalibration(P);
    Eyelink('Message', 'SYNCTIME');
end

% --------------------------------------------------------
% Break after 20 trials
% --------------------------------------------------------

division = itrial/20
if round(division) == division
    Break = DrawFormattedText(myWindow, INFO.P.text_break,...
        'center', INFO.P.screen.cy-500, [255, 255, 255, 255], [],[],[], 2);
    my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,...
        INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color,...
        INFO.P.stim.background_color,  INFO.P.screen.pixperdeg);
    Screen('Flip', myWindow);
    WaitSecs(INFO.P.paradigm_break);
    Report1 = 0
    while Report1 == 0
        restart = DrawFormattedText(myWindow, INFO.P.text_restart,...
            'center', INFO.P.screen.cy-500, [255, 255, 255, 255], [],[],[], 2);
        my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,...
            INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color,...
            INFO.P.stim.background_color, INFO.P.screen.pixperdeg);
        Screen('Flip', myWindow);
        if button(INFO.P.setup.padh,2) == 1
            Report1 = 1
        end
    end
    if INFO.P.setup.isEYEtrack
        EyelinkRecalibration(P);
        Eyelink('Message', 'SYNCTIME');
    end
end
