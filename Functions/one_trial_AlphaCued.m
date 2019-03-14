function [INFO, isQuit] = one_trial_AlphaCued(myWindow, INFO, itrial)


isQuit=0
% Run one trial

% Recalibration
if INFO.P.setup.isEYEtrack && itrial~=1 %
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
my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy, INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color, INFO.P.stim.background_color, INFO.P.screen.pixperdeg)
Screen('Flip', myWindow);
WaitSecs(INFO.P.paradigm_blank)


% --------------------------------------------------------
% Precue
% --------------------------------------------------------
set_pre_cue(myWindow,INFO, itrial)
WaitSecs(INFO.P.paradigm_precue)

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
my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy, INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color, INFO.P.stim.background_color,  INFO.P.screen.pixperdeg)
Screen('Flip', myWindow);
WaitSecs(INFO.P.paradigm_delay)

% --------------------------------------------------------
% probe target
% --------------------------------------------------------
set_probe_target(myWindow,INFO,itrial)
WaitSecs(INFO.P.paradigm_detection)

my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy, INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color, INFO.P.stim.background_color, INFO.P.screen.pixperdeg)
Screen('Flip', myWindow);
WaitSecs(INFO.P.paradigm_delay2)

if INFO.T(itrial).probes == 1
    Trigger2 = 22
    Trigger3 = 31
end
if INFO.T(itrial).probes == 2
    Trigger2 = 21
    Trigger3 = 32
end
if INFO.T(itrial).probes == 3
    Trigger2 = 21
    Trigger3 = 31
end
if INFO.T(itrial).probes == 4
    Trigger2 = 22
    Trigger3 = 32
end

% send trigger to EEG
if INFO.P.setup.isEYEtrack
    EyeLinkMessage = 'Probes ';
    Eyelink('Message', EyeLinkMessage, itrial);
    SendTrigger(Trigger2, P.TriggerDuration);
    SendTrigger(Trigger3, P.TriggerDuration);
end
% --------------------------------------------------------
% attention target
% --------------------------------------------------------
% round(INFO.P.grating_tilt_width_pix)
% round(INFO.P.grating_tilt_height_pix)
gabortex = CreateProceduralGabor(myWindow, 89, 89, [], [0.5 0.5 0.5 0.0]);
set_attention_target(myWindow,gabortex,INFO,itrial)
WaitSecs(INFO.P.paradigm_tilt)

% % --------------------------------------------------------
% % response cue + Delay
% % --------------------------------------------------------
% set_response_cue(myWindow, INFO, itrial)
% WaitSecs(INFO.P.paradigm_responscue+INFO.P.paradigm_delay)

% --------------------------------------------------------
% delay
% --------------------------------------------------------
my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy, INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color, INFO.P.stim.background_color, INFO.P.screen.pixperdeg)
Screen('Flip', myWindow);
WaitSecs(INFO.P.paradigm_delay)

% --------------------------------------------------------
% questions
% --------------------------------------------------------
[responseKeyRight, responseKeyLeft, responseKeyAttention,RTRight,RTLeft,RTAttention, INFO] = set_questions(myWindow, INFO, itrial, isQuit)
INFO.T(itrial).button_probes_right = responseKeyRight
INFO.T(itrial).RT_right = RTRight
INFO.T(itrial).button_probes_left = responseKeyLeft
INFO.T(itrial).RT_left = RTLeft
INFO.T(itrial).button_attention = responseKeyAttention
INFO.T(itrial).RT_attention = RTAttention

[INFO, Correct_probes_right,Correct_probes_left, Correct_attention] = response_validity (INFO, itrial)
INFO.T(itrial).Correct_probes_right = Correct_probes_right
INFO.T(itrial).Correct_probes_left = Correct_probes_left
INFO.T(itrial).Correct_attention = Correct_attention


% --------------------------------------------------------
% End of the trial
% --------------------------------------------------------
my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy, INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color, INFO.P.stim.background_color, INFO.P.screen.pixperdeg)
Screen('Flip', myWindow);
WaitSecs(INFO.P.paradigm_ITI)

if EyeIsLost ==1
    EyelinkRecalibration(P);
    Eyelink('Message', 'SYNCTIME');
end


