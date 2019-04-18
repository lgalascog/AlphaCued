clear
close all
addpath('./Functions');

name  ='test2';

INFO.name              = name;
INFO.logfilename       = ['Alpha_Cued_Lateralization/Logfiles/' name '_Logfile.mat'];
INFO.P = get_parameters;

itrial = 1
INFO.T(itrial).pre_cue = 1 ;
INFO.T(itrial).probes_position_right = 2;
INFO.T(itrial).probes_position_left = 2;
INFO.T(itrial).probes = 3;
INFO.T(itrial).attention_position = 4;
INFO.T(itrial).validity = 1;
INFO.T(itrial).orientation = 2;

INFO.T(itrial).Contrast_probes = 1
INFO.T(itrial).Contrast_attention = 0.75
isQuit = 0
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
%HideCursor

[INFO] = one_trial_train1(myWindow,INFO,itrial,isQuit);

Screen('CloseAll');
ShowCursor;