function [INFO] = one_trial_AlphaCued(myWindow, INFO, itrial)


% Run one trial

% --------------------------------------------------------
% Prestimulus interval
% --------------------------------------------------------
my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy, INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color, INFO.P.stim.background_color, 1)
Screen('Flip', myWindow);
WaitSecs(INFO.P.paradigm_blank)


% --------------------------------------------------------
% Precue
% --------------------------------------------------------
set_pre_cue(myWindow,INFO, itrial)
WaitSecs(INFO.P.paradigm_precue)
% --------------------------------------------------------
% Delay
% --------------------------------------------------------
my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy, INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color, INFO.P.stim.background_color, 1)
Screen('Flip', myWindow);
WaitSecs(INFO.P.paradigm_delay)

% --------------------------------------------------------
% probe target
% --------------------------------------------------------
set_probe_target(myWindow,INFO,itrial)
WaitSecs(INFO.P.paradigm_detection)

my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy, INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color, INFO.P.stim.background_color, 1)
Screen('Flip', myWindow);
WaitSecs(INFO.P.paradigm_delay2)
% --------------------------------------------------------
% attention target
% --------------------------------------------------------
gabortex = CreateProceduralGabor(myWindow, INFO.P.grating_tilt_width,INFO.P.grating_tilt_height, [], [0.5 0.5 0.5 0.0]);
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
my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy, INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color, INFO.P.stim.background_color, 1)
Screen('Flip', myWindow);
WaitSecs(INFO.P.paradigm_delay)

% --------------------------------------------------------
% questions
% --------------------------------------------------------
[responseKeyRight, responseKeyLeft, responseKeyAttention,RTRight,RTLeft,RTAttention, INFO] = set_questions(myWindow, INFO, itrial)
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
my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy, INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color, INFO.P.stim.background_color, 1)
Screen('Flip', myWindow);
WaitSecs(INFO.P.paradigm_ITI)

