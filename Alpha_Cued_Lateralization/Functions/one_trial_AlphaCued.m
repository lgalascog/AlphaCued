function [INFO, isQuit] = one_trial_AlphaCued(myWindow, INFO, itrial, joy)
% Run one trial
isQuit=0;
% EyeHasMoved = 0;
% EyeIsLost = 0;
% joy = HebiJoystick(1);
% joy = vrjoystick(1);

if itrial == 1
    [INFO] = normalized_timing(INFO);
end

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


% Recalibration si perte depuis 3 essais a corriger
if INFO.P.setup.isEYEtrack && itrial > 3 && INFO.T(itrial-3).GazeHasMovedOrEyeIsLost == 1 && INFO.T(itrial-2).GazeHasMovedOrEyeIsLost == 1 && INFO.T(itrial-1).GazeHasMovedOrEyeIsLost
    EyelinkRecalibration(INFO.P.E);
    Eyelink('Message', 'SYNCTIME');
end

% Send onset triggers
if INFO.P.setup.isEYEtrack
%     EyeLinkMessage1 = ['TrialID', itrial] ;
%     EyelinkSendTabMsg(EyeLinkMessage1, Trigg + 10,'eyelink connected',1)
EyelinkSendTabMsg('TrialID', itrial, Trigg + 10,'eyelink connected',1)
end
if INFO.P.setup.isEEG
    SendTrigger(Trigg + 10, INFO.P.TriggerDuration);
end

% --------------------------------------------------------
% Prestimulus interval
% --------------------------------------------------------
% Preparation pre_stim
my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,... 
   INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color,...
   INFO.P.stim.background_color, INFO.P.screen.pixperdeg);

% Flip pre_stim
INFO.T(itrial).vbl_fixation = Screen('Flip',myWindow,INFO.P.paradigm_blank_norm-.5*INFO.P.setup.ITI);

% Screen('Flip', myWindow, INFO.P.paradigm_blank_norm-.5*INFO.P.setup.ITI);
% WaitSecs(INFO.P.paradigm_blank);


% --------------------------------------------------------
% Precue
% --------------------------------------------------------
%Prepare cue
set_pre_cue(myWindow,INFO, itrial);

%Gaze Control
if INFO.P.setup.isEYEtrack
    Tmin = INFO.P.paradigm_precue_norm - INFO.P.setup.ITI;
    [~, ~, hsmvd] = EyelinkControlFixation(INFO.P.E,...
        Tmin, 0.002, [INFO.P.CenterX, INFO.P.CenterY],...
        INFO.P.E.FixLenDeg, INFO.P.setup.isEYEtrack, INFO.P.screen.pixperdeg,...
        0, INFO.P.E.IgnoreBlinks);
end

% Flip Cue
INFO.T(itrial).vbl_cue = Screen('Flip', myWindow, INFO.T(itrial).vbl_fixation + INFO.P.paradigm_precue_norm-.5*INFO.P.setup.ITI);

% Send triggers cue
if INFO.P.setup.isEYEtrack
    EyeLinkMessage2 = 'Cue';
    EyelinkSendTabMsg(EyeLinkMessage2, Trigg + 20, 'eyelink connected',1) % remember to modisy the order, if needed
end

if INFO.P.setup.isEEG
    SendTrigger(Trigg + 20, INFO.P.TriggerDuration);
end

if INFO.P.setup.isEYEtrack
    if hsmvd == 1
        INFO.T(itrial).GazeHasMovedOrEyeIsLost = 1;
        hsmvd = 0;
    end
end

% WaitSecs(INFO.P.paradigm_precue);

% --------------------------------------------------------
% Delay
% --------------------------------------------------------
% Prepare blank Screen
my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,...
   INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color,...
   INFO.P.stim.background_color,  INFO.P.screen.pixperdeg);

% Gaze control
if INFO.P.setup.isEYEtrack
    Tmin = INFO.P.paradigm_delay_between_cue_and_stim_norm - INFO.P.setup.ITI;
    [~, ~, hsmvd] = EyelinkControlFixation(INFO.P.E,...
        Tmin, 0.002, [INFO.P.CenterX, INFO.P.CenterY],...
        INFO.P.E.FixLenDeg, INFO.P.setup.isEYEtrack, INFO.P.screen.pixperdeg,...
        0, INFO.P.E.IgnoreBlinks);
end

% Flip blank screen
INFO.T(itrial).vbl_delay1 = Screen('Flip', myWindow,  INFO.T(itrial).vbl_cue + INFO.P.paradigm_delay_between_cue_and_stim_norm-.5*INFO.P.setup.ITI);

if INFO.P.setup.isEYEtrack
    if hsmvd == 1
        INFO.T(itrial).GazeHasMovedOrEyeIsLost = 1;
        hsmvd = 0;
    end
end

% Screen('Flip', myWindow);
% WaitSecs(INFO.P.paradigm_delay_between_cue_and_stim);

% --------------------------------------------------------
% Stimuli
% --------------------------------------------------------
% Prepare target
gabortex = CreateProceduralGabor(myWindow, INFO.P.grating_tilt_width_pix,...
INFO.P.grating_tilt_height_pix, [], [0.5 0.5 0.5 0.0]);
[INFO] = set_probe_target(myWindow,INFO,itrial,gabortex);

% Gaze control
if INFO.P.setup.isEYEtrack
    Tmin = INFO.P.paradigm_stim_norm - INFO.P.setup.ITI;
    [~, ~, hsmvd] = EyelinkControlFixation(INFO.P.E,...
        Tmin, 0.002, [INFO.P.CenterX, INFO.P.CenterY],...
        INFO.P.E.FixLenDeg, INFO.P.setup.isEYEtrack, INFO.P.screen.pixperdeg,...
        0, INFO.P.E.IgnoreBlinks);
end

% Flip target
INFO.T(itrial).vbl_target = Screen('Flip', myWindow, INFO.T(itrial).vbl_delay1  + INFO.P.paradigm_stim_norm-.5*INFO.P.setup.ITI);

% Send stim triggers
if INFO.P.setup.isEYEtrack
    EyeLinkMessage3 =  'Probes + gabor';
    EyelinkSendTabMsg(EyeLinkMessage3, Trigg + 30,'eyelink connected',1)
end

if INFO.P.setup.isEEG
    SendTrigger(Trigg + 30, INFO.P.TriggerDuration);
end

if INFO.P.setup.isEYEtrack
    if hsmvd == 1
        INFO.T(itrial).GazeHasMovedOrEyeIsLost = 1;
        hsmvd = 0;
    end
end

% WaitSecs(INFO.P.paradigm_stim);
% --------------------------------------------------------
% delay
% --------------------------------------------------------
my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,...
    INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color,...
    INFO.P.stim.background_color, INFO.P.screen.pixperdeg);
INFO.T(itrial).vbl_delay2 = Screen('Flip', myWindow, INFO.T(itrial).vbl_target + INFO.P.paradigm_delay_before_question_norm-.5*INFO.P.setup.ITI);
%WaitSecs(INFO.P.paradigm_delay_before_question);

% --------------------------------------------------------
% questions
% --------------------------------------------------------
[pressedButts, INFO, isQuit, joy] = set_questions(myWindow, INFO, isQuit,joy);
% close(joy)  %%%%%%%%%%%%%%%%%%%%%%%%%%%% commented 27 may eb

INFO.T(itrial).button_pressed = pressedButts;


if find([pressedButts{:}] == 0)  %%%%%%%%%%%%%%%%%%%%%%%%%%% if hebijoystick
    INFO.T(itrial).button_probes_left = 'U'; %left up pressed
elseif find([pressedButts{:}] == 180)
    INFO.T(itrial).button_probes_left = 'D'; %left down pressed
else
    INFO.T(itrial).button_probes_left = 'N';
end

% if find([pressedButts{:}] == -1)  %%%%%%%%%%%%%%%%%%%%%%%%%%% if vrjoystick
%     INFO.T(itrial).button_probes_left = 'U'; %left up pressed
% elseif find([pressedButts{:}] == 1)
%     INFO.T(itrial).button_probes_left = 'D'; %left down pressed
% else
%     INFO.T(itrial).button_probes_left = 'N';
% end

if find(strcmp(pressedButts,'Y' ))
    INFO.T(itrial).button_probes_right = 'U'; %right up pressed
elseif find(strcmp(pressedButts,'A' ))
    INFO.T(itrial).button_probes_right = 'D'; %right down pressed
else
    INFO.T(itrial).button_probes_right = 'N';
end

if find(strcmp(pressedButts,'RB' ))
    INFO.T(itrial).button_attention = 'R'; %Tilted to the right
elseif find(strcmp(pressedButts,'LB' ))
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
INFO.T(itrial).vbl_feedback = Screen('Flip', myWindow, INFO.T(itrial).vbl_delay2 + (INFO.P.paradigm_ITI_norm/2)-.5*INFO.P.setup.ITI);

% --------------------------------------------------------
% End of the trial
% --------------------------------------------------------
my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,...
    INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color,...
    INFO.P.stim.background_color, INFO.P.screen.pixperdeg);
Screen('Flip', myWindow, INFO.T(itrial).vbl_feedback + (INFO.P.paradigm_ITI_norm/2)-.5*INFO.P.setup.ITI);
%WaitSecs(INFO.P.paradigm_ITI/2-.5*INFO.P.setup.ITI);

% send offset triggers
if INFO.P.setup.isEYEtrack
    EyeLinkMessage4 =  'offset';
    EyelinkSendTabMsg(EyeLinkMessage4, Trigg + 40,'eyelink connected',1)
end
if INFO.P.setup.isEEG
    SendTrigger(Trigg + 40, INFO.P.TriggerDuration);
end

% if INFO.P.setup.isEYEtrack
%     if EyeHasMoved == 1 || EyeIsLost == 1
%         INFO.T.GazeHasMovedOrEyeIsLost = 1;
%         EyeHasMoved = 0;
%         EyeIsLost = 0;
%     end
% end

% if EyeIsLost == 1
%     EyelinkRecalibration(INFO.P.E);
%     Eyelink('Message', 'SYNCTIME');
% end

% added by eb 03-May-2019
% since the textures might occupy a lot of memory cumulatively, better to
% close them at each trial ending
Screen('Close', gabortex);
% close(joy)

% --------------------------------------------------------
% Break after 20 trials
% --------------------------------------------------------

division = itrial/20;
if round(division) == division
    %Save the file every 20 trials
    INFO.ntrials = itrial;
    save(INFO.logfilename, 'INFO');
    
    % joy2 = HebiJoystick(1); %%%%%%%%%%%%%%%%%%%%%%%%%%%% commented 27 may eb
    %joy2 = vrjoystick(1);
    DrawFormattedText(myWindow, INFO.P.text_break,...
        'center', INFO.P.screen.cy-500, [255, 255, 255, 255], [],[],[], 2);
    my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,...
        INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color,...
        INFO.P.stim.background_color,  INFO.P.screen.pixperdeg);
    Screen('Flip', myWindow);
    WaitSecs(INFO.P.paradigm_break);
    Report1 = 0;
    while Report1 == 0
        DrawFormattedText(myWindow, INFO.P.text_restart,...
            'center', INFO.P.screen.cy-500, [255, 255, 255, 255], [],[],[], 2);
        my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,...
            INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color,...
            INFO.P.stim.background_color, INFO.P.screen.pixperdeg);
        Screen('Flip', myWindow);
               
        if button(joy,3) == 1 %office: button(joy,2) == 1
            Report1 = 1;
        end
        
    end
    if INFO.P.setup.isEYEtrack
        EyelinkRecalibration(INFO.P.E);
        Eyelink('Message', 'SYNCTIME');
    end
    % close(joy2)  %%%%%%%%%%%%%%%%%%%%%%%%%%%% commented 27 may eb
end
