function [INFO] = one_trial_AlphaCued(myWindow, INFO, itrial)


% Run one trial

% --------------------------------------------------------
% Prestimulus interval
% --------------------------------------------------------
DrawScreen_with_fixation_square(myWindow,INFO)

WaitSecs(INFO.P.paradigm_blank)


% --------------------------------------------------------
% Precue
% --------------------------------------------------------
set_pre_cue(myWindow,INFO, itrial)

WaitSecs(INFO.P.paradigm_precue)
% --------------------------------------------------------
% Delay
% --------------------------------------------------------
WaitSecs('UntilTime', INFO.P.paradigm_delay)

% --------------------------------------------------------
% probe target
% --------------------------------------------------------
gabortex = CreateProceduralGabor(myWindow, INFO.P.grating_detection_width,INFO.P.grating_detection_height, [], [0.5 0.5 0.5 0.0]);
set_probe_target(myWindow,gabortex,INFO,itrial)
WaitSecs(INFO.P.paradigm_detection)


% --------------------------------------------------------
% attention target
% --------------------------------------------------------
set_attention_target(myWindow,gabortex,INFO,itrial)
WaitSecs(INFO.P.paradigm_tilt)

% --------------------------------------------------------
% response cue + Delay
% --------------------------------------------------------
set_response_cue(myWindow, INFO, itrial)
WaitSecs(INFO.P.paradigm_responscue+INFO.P.paradigm_delay)

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

[INFO, Correct_probes, Correct_attention] = response_validity (INFO, itrial)
INFO.T(itrial).Correct_probes = Correct_probes
INFO.T(itrial).Correct_attention = Correct_attention


% --------------------------------------------------------
% End of the trial
% --------------------------------------------------------
DrawScreen_with_fixation_square(myWindow,INFO)
WaitSecs(INFO.P.paradigm_ITI)

