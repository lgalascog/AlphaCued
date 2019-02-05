clear
close all
addpath('./Functions');

name  ='test';

INFO.name              = name;
INFO.logfilename       = ['Logfiles' filesep name '_Logfile.mat'];
INFO.P = get_parameters;



%% ------------------------------------------------------------------------
% Test if logfile exists for this subject.
% If yes, confirm to overwrite or quit.
% ------------------------------------------------------------------------
switch name
    case 'test'
        isQuit = 0;
        % logfile will be automatically overwritten 
    otherwise
        isQuit = test_logfile(INFO);
end

if isQuit
    CloseAndCleanup(P)
    return
end



%% -----------------------------------------------------------------------
% Define what do do on each trial.
% ------------------------------------------------------------------------
INFO = define_trials(INFO);


%% -----------------------------------------------------------------------
% Open the display and set priority.
% ------------------------------------------------------------------------
PsychDefaultSetup(1);
Screen('Preference', 'SkipSyncTests', INFO.P.setup.skipsync);
Screen('Resolution', INFO.P.screen.screen_num, INFO.P.screen.width, ...
    INFO.P.screen.height, INFO.P.screen.rate);

[win, winrect] = PsychImaging('Openwindow', ...
    INFO.P.screen.screen_num, INFO.P.stim.background_color);

Priority(MaxPriority(win));

if INFO.P.setup.useCLUT
    addpath('./CLUT');
    load(INFO.P.setup.CLUTfile);
    Screen('LoadNormalizedGammaTable',win,inverseCLUT);
end



%%----------------------------------------------------------------------
% Run across trials.
%----------------------------------------------------------------------

