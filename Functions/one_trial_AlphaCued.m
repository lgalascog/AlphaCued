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

% Remove the cue
% Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_rects);
% Screen('Flip', myWindow);

% --------------------------------------------------------
% Delay
% --------------------------------------------------------
WaitSecs('UntilTime', INFO.P.paradigm_delay)

% --------------------------------------------------------
% probe target
% --------------------------------------------------------
% location_right_probes = INFO.P.rects_right(rand_position_right(1))
% location_left_probes = INFO.P.rects_left(rand_position_left(1))
gabortex = CreateProceduralGabor(myWindow, INFO.P.grating_detection_width,INFO.P.grating_detection_height, [], [0.5 0.5 0.5 0.0]);
set_probe_target(myWindow,gabortex,INFO,itrial)
WaitSecs(INFO.P.paradigm_detection)

% Remove the target
% Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_rects);
% Screen('Flip', myWindow);

% --------------------------------------------------------
% attention target
% --------------------------------------------------------


set_attention_target(myWindow,gabortex,INFO,itrial)
WaitSecs(INFO.P.paradigm_tilt)

% Remove the target
% Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_rects);
% Screen('Flip', myWindow);

% --------------------------------------------------------
% response cue + Delay
% --------------------------------------------------------


 set_response_cue(myWindow, INFO, itrial)
WaitSecs(INFO.P.paradigm_responscue+INFO.P.paradigm_delay)

% --------------------------------------------------------
% questions
% --------------------------------------------------------
[responseKey1, responseKey2, responseKey3,RT1,RT2,RT3, INFO] = set_questions(myWindow, INFO, itrial)

INFO.T(itrial).button_probes_1 = responseKey1
INFO.T(itrial).RT_1 = RT1
INFO.T(itrial).button_probes_2 = responseKey2
INFO.T(itrial).RT_2 = RT2
INFO.T(itrial).button_attention = responseKey3
INFO.T(itrial).RT_3 = RT3

% --------------------------------------------------------
% End of the trial
% --------------------------------------------------------
DrawScreen_with_fixation_square(myWindow,INFO)
WaitSecs(INFO.P.paradigm_ITI)

