function [INFO] = one_trial_AlphaCued(INFO, itrial)

% Select two positions for each side of the screen
rand_position_right = randperm(5,2) %select 2 DIFFERENTS positions for the probes and the attention target
rand_position_left = randperm(5,2)

% Run one trial


% --------------------------------------------------------
% Prestimulus interval
% --------------------------------------------------------
DrawScreen_with_fixation_square

WaitSecs('UntilTime', INFO.P.paradigm_blank)

% --------------------------------------------------------
% Precue
% --------------------------------------------------------
set_pre_cue(INFO.T, itrial)

WaitSecs('UntilTime', INFO.P.paradigm_precue)

% Remove the cue
Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_square_position);
Screen('Flip', myWindow);

% --------------------------------------------------------
% Delay
% --------------------------------------------------------
WaitSecs('UntilTime', INFO.P.paradigm_delay)

% --------------------------------------------------------
% probe target
% --------------------------------------------------------
location_right_probes = INFO.P.rects_right(rand_position_right(1))
location_left_probes = INFO.P.rects_left(rand_position_left(1))

set_probe_target

WaitSecs('UntilTime',INFO.P.paradigm_detection)

% Remove the target
Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_square_position);
Screen('Flip', myWindow);

% --------------------------------------------------------
% attention target
% --------------------------------------------------------

location_right_attention = INFO.P.rects_right(rand_position_right(2))
location_left_attention = INFO.P.rects_left(rand_position_left(2))

set_attention_target

WaitSecs('UntilTime',INFO.P.paradigm_tilt)

% Remove the target
Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_square_position);
Screen('Flip', myWindow);

% --------------------------------------------------------
% response cue + Delay
% --------------------------------------------------------


set_response_cue

WaitSecs('UntilTime', INFO.P.paradigm_responscue+INFO.P.paradigm_delay)

% --------------------------------------------------------
% questions
% --------------------------------------------------------
set_questions


% --------------------------------------------------------
% End of the trial
% --------------------------------------------------------
DrawScreen_with_fixation_square
WaitSecs('UntilTime', INFO.P.paradigm_ITI)
