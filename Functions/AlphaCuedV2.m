clear
close all
addpath('./Functions');

name  ='test';

INFO.name              = name;
INFO.logfilename       = ['Logfiles' filesep name '_Logfile.mat'];
INFO.P = get_parameters;

% Octave's new plotting backend 'fltk' interferes with Screen(),
% due to internal use of OpenGL. Problem is it changes the
% bound OpenGL rendering context behind our back and we
% don't protect ourselves against this yet. Switch plotting backend
% to good'ol gnuplot to work around this issue until we fix it properly
% inside Screen():
if IsOctave && exist('graphics_toolkit')
    graphics_toolkit ('gnuplot');
end



%% -----------------------------------------------------------------------
% Define what do do on each trial.
% ------------------------------------------------------------------------
INFO = define_trials_AlphaCued(INFO);


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


%%----------------------------------------------------------------------
% Run across trials.
%----------------------------------------------------------------------
for itrial = 1:length(INFO.T)
    rand_position_right = randperm(5,2) %select 2 DIFFERENTS positions for the probes and the attention target
    rand_position_left = randperm(5,2)
    location_right_probes = INFO.P.rects_right(:,rand_position_right(1))
    location_left_probes = INFO.P.rects_left(:,rand_position_left(1))
    INFO.P(1).location_right_probes = location_right_probes
    INFO.P(1).location_left_probes = location_left_probes
    
    location_right_attention = INFO.P.rects_right(:,rand_position_right(2))
    location_left_attention = INFO.P.rects_left(:,rand_position_left(2))
    INFO.P(1).location_right_attention = location_right_attention
    INFO.P(1).location_left_attention = location_left_attention
    
    
    [INFO] = one_trial_AlphaCued(myWindow,INFO, itrial);
end
