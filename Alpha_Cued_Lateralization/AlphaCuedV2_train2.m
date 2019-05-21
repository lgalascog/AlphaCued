function AlphaCuedV2_train2(INFO,name)
% clear
% close all
% addpath('./Functions');
% 
% name  ='test2';
% 
% INFO.name              = name;
% INFO.logfilename       = ['Alpha_Cued_Lateralization/Logfiles/' name '_Logfile.mat'];
% INFO.P = get_parameters;


%% -----------------------------------------------------------------------
% Define what do do on each trial.
% ------------------------------------------------------------------------
[INFO] = define_what_to_do(INFO)
INFO.T = INFO.T(1:10)
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
% Screen('Resolution', INFO.P.screen.screen_num, INFO.P.screen.width, ...
%     INFO.P.screen.height, INFO.P.screen.rate);    % commented by eb
%     03-May-2019: "Resolution" command seems to have been called twice.
%     The second time should be related to a change in the parameters (?)
%     when the parameters are the same this might result in an error (??)

[myWindow, windowRect] = PsychImaging('Openwindow', ...
    INFO.P.screen.screen_num, INFO.P.stim.background_color);

Priority(MaxPriority(myWindow));

INFO.P.setup.ITI = Screen('GetFlipInterval',myWindow)

if INFO.P.setup.useCLUT
    %addpath('/home/busch/Documents/MATLAB/wm_utilities/ViewPixx/inverse_CLUT_2019-02-05.mat');
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
        [keyIsDown, EndRT, keyCode] = KbCheck(); % try not to specify device in use and collect evidence from any device
    end
    WaitSecs(INFO.P.WaitAfterButtonPress);
end

%% -----------------------------------------------------------------------
% Initialize EyeTracker (incl. calibrate) & EEG
% -----------------------------------------------------------------------

% if INFO.P.setup.isEEG
%     OpenTriggerPort;
% end

if INFO.P.setup.isEYEtrack
    % OpenTriggerPort;
    % launch devices
    SendTrigger(INFO.P.TriggerStartRecording,INFO.P.TriggerDuration);
    [INFO.P.E,myWindow] = EyelinkStart(INFO.P.E, myWindow, ['AI_' name '.edf']);
end

%%----------------------------------------------------------------------
% Run across trials.
%----------------------------------------------------------------------
%HideCursor
for itrial = 1:length(INFO.T)
    % Get Quest's recommendation for a contrast value.
    % Yes/No detection task
    INFO.T(itrial).Contrast_probes = 10^QuestQuantile(INFO.Q(1));
    if INFO.T(itrial).Contrast_probes > 1;
        INFO.T(itrial).Contrast_probes = 1;
    end
    % 2AFC discrimination task
    INFO.T(itrial).Contrast_attention = 10^QuestQuantile(INFO.Q(2));
    if INFO.T(itrial).Contrast_attention > deg2rad(45);
       INFO.T(itrial).Contrast_attention = deg2rad(45);
    end
    if INFO.T(itrial).Contrast_attention < deg2rad(1);
        INFO.T(itrial).Contrast_attention = deg2rad(1);
    end
    
    [INFO, isQuit] = one_trial_train2(myWindow,INFO, itrial);
   
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
    
    if isQuit
        CloseAndCleanup(INFO.P);
        break
    else
        INFO.ntrials = itrial;
        save(INFO.logfilename, 'INFO');
    end

    


end

if INFO.P.setup.isEYEtrack
    EyelinkStop(INFO.P.E);
    SendTrigger(INFO.P.TriggerStopRecording,INFO.P.TriggerDuration);
end

WaitSecs(2);
CloseAndCleanup(INFO.P )
sca
fprintf('\nDONE!\n\n');