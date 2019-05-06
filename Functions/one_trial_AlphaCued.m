function [INFO, isQuit] = one_trial_AlphaCued(myWindow, INFO, itrial)
% Run one trial
isQuit=0;
EyeHasMoved = 0;
EyeIsLost = 0;

% Triggers
cue_dir = INFO.T(itrial).pre_cue;

if INFO.T(itrial).probes == 1 || INFO.T(itrial).probes == 3
    right_probes = 1;
else
    right_probes = 2;
end

if INFO.T(itrial).probes == 2 || INFO.T(itrial).probes == 3
    left_probes = 1;
else 
    left_probes = 2;
end

Trigg = sub2ind([2,2,2],cue_dir,left_probes,right_probes);


% Recalibration
if INFO.P.setup.isEYEtrack && itrial~=1; %
    EyelinkRecalibration(INFO.P);
    Eyelink('Message', 'SYNCTIME');
end

% Send onset triggers
if INFO.P.setup.isEYEtrack
    EyeLinkMessage1 = ['TrialID', itrial] ;
    EyelinkSendTabMsg(EyeLinkMessage1, Trigg + 10)
end
if INFO.P.setup.isEEG
    SendTrigger(Trigg + 10, INFO.P.TriggerDuration);
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
if INFO.P.setup.isEYEtrack
    EyeLinkMessage2 = 'Cue';
    EyelinkSendTabMsg(EyeLinkMessage2, Trigg + 20) % remember to modisy the order, if needed
%     Eyelink('Message', EyeLinkMessage, itrial);    
    %Ad while loop
    % check if gaze position is within boudaries
    [~,~,EyeHasMoved] = EyelinkGetGaze(INFO.P.E);
end

if INFO.P.setup.isEEG
    SendTrigger(Trigg + 20, INFO.P.TriggerDuration);
end

if INFO.P.setup.isEYEtrack
    if EyeHasMoved == 1 || EyeIsLost == 1
        INFO.T.GazeHasMovedOrEyeIsLost = 1;
        EyeHasMoved = 0;
        EyeIsLost = 0;
    end
end
WaitSecs(INFO.P.paradigm_precue);

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

% send stim triggers
if INFO.P.setup.isEYEtrack
    EyeLinkMessage3 =  'Probes + gabor';
    EyelinkSendTabMsg(EyeLinkMessage3, Trigg + 30)
end

if INFO.P.setup.isEEG
    SendTrigger(Trigg + 30, INFO.P.TriggerDuration);
end

if INFO.P.setup.isEYEtrack
    if EyeHasMoved == 1 || EyeIsLost == 1
        INFO.T.GazeHasMovedOrEyeIsLost = 1;
        EyeHasMoved = 0;
        EyeIsLost = 0;
    end
end

WaitSecs(INFO.P.paradigm_stim);
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
[pressedButts, INFO,isQuit] = set_questions(myWindow, INFO, itrial, isQuit);

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

% send offset triggers
if INFO.P.setup.isEYEtrack
    EyeLinkMessage4 =  'offset';
    EyelinkSendTabMsg(EyeLinkMessage3, Trigg + 40)
    % check if gaze position is within boudaries
    [~,~,EyeHasMoved] = EyelinkGetGaze(INFO.P.E);
end
if INFO.P.setup.isEEG
    SendTrigger(Trigg + 40, INFO.P.TriggerDuration);
end

if INFO.P.setup.isEYEtrack
    if EyeHasMoved == 1 || EyeIsLost == 1
        INFO.T.GazeHasMovedOrEyeIsLost = 1;
        EyeHasMoved = 0;
        EyeIsLost = 0;
    end
end

if EyeIsLost == 1
    EyelinkRecalibration(INFO.P.E);
    Eyelink('Message', 'SYNCTIME');
end

% added by eb 03-May-2019
% since the textures might occupy a lot of memory cumulatively, better to
% close them at each trial ending
Screen('Close', gabortex);

% --------------------------------------------------------
% Break after 20 trials
% --------------------------------------------------------

division = itrial/20;
if round(division) == division
    Break = DrawFormattedText(myWindow, INFO.P.text_break,...
        'center', INFO.P.screen.cy-500, [255, 255, 255, 255], [],[],[], 2);
    my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,...
        INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color,...
        INFO.P.stim.background_color,  INFO.P.screen.pixperdeg);
    Screen('Flip', myWindow);
    WaitSecs(INFO.P.paradigm_break);
    Report1 = 0;
    while Report1 == 0
        restart = DrawFormattedText(myWindow, INFO.P.text_restart,...
            'center', INFO.P.screen.cy-500, [255, 255, 255, 255], [],[],[], 2);
        my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,...
            INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color,...
            INFO.P.stim.background_color, INFO.P.screen.pixperdeg);
        Screen('Flip', myWindow);
        if button(INFO.P.setup.padh,2) == 1
            Report1 = 1;
        end
    end
    if INFO.P.setup.isEYEtrack
        EyelinkRecalibration(INFO.P.E);
        Eyelink('Message', 'SYNCTIME');
    end
end
