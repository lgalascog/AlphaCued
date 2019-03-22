clear
close all
addpath('./Functions');

name  ='test2';

INFO.name              = name;
INFO.logfilename       = ['Alpha_Cued_Lateralization/Logfiles/' name '_Logfile.mat'];
INFO.P = get_parameters;


%% -----------------------------------------------------------------------
% Define what do do on each trial.
% ------------------------------------------------------------------------
INFO = define_trials_AlphaCued(INFO);

% ------------------------------------------------------------------------
% Initiate Quest.
% ------------------------------------------------------------------------        
% Yes/No detection task
INFO.Q(1) = QuestCreate(INFO.P.Quest_Guess(1), ...
            INFO.P.Quest_Std(1), ...
            INFO.P.Quest_pThreshold(1), ...
            INFO.P.Quest_beta(1), ...
            INFO.P.Quest_delta(1), ...
            INFO.P.Quest_gamma(1));
INFO.Q(1).normalizePdf = 1;       
INFO.Q(1) = QuestRecompute(INFO.Q(1)); 

% 2AFC discrimination task
INFO.Q(2) = QuestCreate(INFO.P.Quest_Guess(2), ...
            INFO.P.Quest_Std(2), ...
            INFO.P.Quest_pThreshold(2), ...
            INFO.P.Quest_beta(2), ...
            INFO.P.Quest_delta(2), ...
            INFO.P.Quest_gamma(2));
INFO.Q(2).normalizePdf = 1;        
INFO.Q(2) = QuestRecompute(INFO.Q(2)); 

%% -----------------------------------------------------------------------
% Open the display and set priority.
% ------------------------------------------------------------------------
PsychDefaultSetup(1);
Screen('Preference', 'SkipSyncTests', INFO.P.setup.skipsync);
Screen('Resolution', INFO.P.screen.screen_num, INFO.P.screen.width, ...
    INFO.P.screen.height, INFO.P.screen.rate);

[myWindow, windowRect] = PsychImaging('Openwindow', ...
    INFO.P.screen.screen_num, INFO.P.stim.background_color);

Priority(MaxPriority(myWindow));

if INFO.P.setup.useCLUT
    addpath('./CLUT');
    load(INFO.P.setup.CLUTfile);
    Screen('LoadNormalizedGammaTable',myWindow,inverseCLUT);
end

%% -----------------------------------------------------------------------
% First, Calibration Notification
% -----------------------------------------------------------------------  

if INFO.P.setup.isEYEtrack
    ELtext = 'Eye tracking calibration.\n\n\n\nPlease press the spacebar to start.';
    DrawFormattedText(myWindow, ELtext, 'center', 'center', [0 0 0], [], [], [], 1.5);
    Screen('Flip', myWindow);
    
    % Wait for a button press (only matter if keyIsDown)
    %RestrictKeysForKbCheck(P.Exp.ButtonsExperiment);
    keyIsDown = 0;
    while keyIsDown == 0
        [keyIsDown, EndRT, keyCode] = KbCheck(0);
    end
    WaitSecs(INFO.P.WaitAfterButtonPress);
end

%% -----------------------------------------------------------------------
% Initialize EyeTracker (incl. calibrate) & EEG
% -----------------------------------------------------------------------

if INFO.P.setup.isEEG
    OpenTriggerPort;
end

if INFO.P.setup.isEYEtrack
    % launch devices
    SendTrigger(INFO.P.TriggerStartRecording,INFO.P.TriggerDuration);
    [INFO,myWindow] = EyelinkStart(INFO, myWindow, ['AI_' name '.edf']);
end

%%----------------------------------------------------------------------
% Run across trials.
%----------------------------------------------------------------------
%HideCursor
for itrial = 1:length(INFO.T)      
    % Get Quest's recommendation for a contrast value.
    % Yes/No detection task
    INFO.T(itrial).Contrast_probes = 10^QuestQuantile(INFO.Q(1));
    if INFO.T(itrial).Contrast_probes > 1
        INFO.T(itrial).Contrast_probes = 1;
    end
    % 2AFC discrimination task
    INFO.T(itrial).Contrast_attention = 10^QuestQuantile(INFO.Q(2));
    if INFO.T(itrial).Contrast_attention > 1
       INFO.T(itrial).Contrast_attention = 1;
    end
    
    [INFO, isQuit] = one_trial_AlphaCued(myWindow,INFO, itrial);
   
    % Update Quest
    % Yes/No detection task
    
    if INFO.T(itrial).probes == 2 || INFO.T(itrial).probes == 3; 
        INFO.Q(1) = QuestUpdate(INFO.Q(1), log10(INFO.T(itrial).Contrast_probes),...
           INFO.T(itrial).Correct_probes_left);
    end
    
    if INFO.T(itrial).probes == 1 || INFO.T(itrial).probes == 3;
        INFO.Q(1) = QuestUpdate(INFO.Q(1), log10(INFO.T(itrial).Contrast_probes),...
           INFO.T(itrial).Correct_probes_right);
    end    
        
    INFO.T(itrial).ThresholdEstimate = QuestMean(INFO.Q(1));
    INFO.T(itrial).ThresholdSD       = QuestSd(INFO.Q(1));
    
    
    
    % 2AFC discrimination task
    if INFO.T(itrial).validity == 1;
        INFO.Q(2) = QuestUpdate(INFO.Q(2), log10(INFO.T(itrial).Contrast_attention),... 
           INFO.T(itrial).Correct_attention);
    end
    
    INFO.T(itrial).ThresholdEstimate = QuestMean(INFO.Q(2));
    INFO.T(itrial).ThresholdSD       = QuestSd(INFO.Q(2));
    
    
    save(INFO.logfilename, 'INFO');

    


end

if INFO.P.setup.isEYEtrack
    EyelinkStop(INFO.P);
end

Screen('CloseAll');
ShowCursor;
