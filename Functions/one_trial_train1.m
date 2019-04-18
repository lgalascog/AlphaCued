%One trial train
function [INFO, isQuit] = one_trial_train1(myWindow, INFO, itrial,isQuit)

% --------------------------------------------------------
% Instructions cue
% --------------------------------------------------------
Report1 = 0
while Report1 == 0
    instructions = DrawFormattedText(myWindow, INFO.P.text_instruction_cue,...
        'center', INFO.P.screen.cy-500, [255, 255, 255, 255], [],[],[], 2);
    my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,...
        INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color,...
        INFO.P.stim.background_color, INFO.P.screen.pixperdeg);
    Screen('Flip', myWindow);
    if button(INFO.P.setup.padh,2) == 1
        Report1 = 1
    end
end  

Screen ('FillRect', myWindow, INFO.P.stim.cue_color, INFO.P.stim.cue_rects_2);
my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,...
    INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color,...
    INFO.P.stim.background_color, INFO.P.screen.pixperdeg)
Screen('Flip', myWindow);
WaitSecs(INFO.P.paradigm_precue_train1);

% --------------------------------------------------------
% Delay
% --------------------------------------------------------
my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,...
   INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color,...
   INFO.P.stim.background_color,  INFO.P.screen.pixperdeg);
Screen('Flip', myWindow);
WaitSecs(INFO.P.paradigm_delay_between_cue_and_stim);

% --------------------------------------------------------
% probe target
% --------------------------------------------------------
Report2 = 0
while Report2 == 0
    instructions = DrawFormattedText(myWindow, INFO.P.text_instruction_circle,...
        'center', INFO.P.screen.cy-500, [255, 255, 255, 255], [],[],[], 2);
    my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,...
        INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color,...
        INFO.P.stim.background_color, INFO.P.screen.pixperdeg);
    Screen('Flip', myWindow);
    if button(INFO.P.setup.padh,2) == 1
        Report2 = 1
    end
end

set_probe_target(myWindow,INFO, itrial) ;

WaitSecs(INFO.P.paradigm_detection_train1);



% --------------------------------------------------------
% attention target
% --------------------------------------------------------
Report3 = 0
while Report3 == 0
instructions = DrawFormattedText(myWindow, INFO.P.text_instruction_gabor,...
    'center', INFO.P.screen.cy-500, [255, 255, 255, 255], [],[],[], 2);
my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,... 
   INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color,...
   INFO.P.stim.background_color, INFO.P.screen.pixperdeg);
Screen('Flip', myWindow);
    if button(INFO.P.setup.padh,2) == 1
        Report3 = 1
    end
end

gabortex = CreateProceduralGabor(myWindow, INFO.P.grating_tilt_width_pix,...
    INFO.P.grating_tilt_height_pix, [], [0.5 0.5 0.5 0.0]);
set_attention_target(myWindow,gabortex,INFO,itrial);
WaitSecs(INFO.P.paradigm_precue_train1);

% --------------------------------------------------------
% delay
% --------------------------------------------------------
my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,...
    INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color,...
    INFO.P.stim.background_color, INFO.P.screen.pixperdeg);
Screen('Flip', myWindow);
WaitSecs(INFO.P.paradigm_delay_before_question);

% --------------------------------------------------------
% questions
% --------------------------------------------------------
[pressedButts, INFO] = set_questions_train1(myWindow, INFO, itrial, isQuit);

INFO.T(itrial).button_pressed = pressedButts;


if find([pressedButts{:}] == 0);
    INFO.T(itrial).button_probes_left = 1;
else
    INFO.T(itrial).button_probes_left = 0;
end

if find(strcmp(pressedButts,'Y' ));
    INFO.T(itrial).button_probes_right = 1;
else
    INFO.T(itrial).button_probes_right = 0;
end

if find(strcmp(pressedButts,'RB' ));
    INFO.T(itrial).button_attention = 1; %Tilted to the right
else
    INFO.T(itrial).button_attention = 0; %Tilted to the left
end


[INFO, Correct_probes_right,Correct_probes_left, Correct_attention] = response_validity (INFO, itrial);
INFO.T(itrial).Correct_probes_right = Correct_probes_right;
INFO.T(itrial).Correct_probes_left = Correct_probes_left;
INFO.T(itrial).Correct_attention = Correct_attention;

% --------------------------------------------------------
% Color feedback
% --------------------------------------------------------

feedback_train1(myWindow, INFO, itrial);
WaitSecs(INFO.P.paradigm_ITI/2);

% --------------------------------------------------------
% End of the trial
% --------------------------------------------------------
my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,...
    INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color,...
    INFO.P.stim.background_color, INFO.P.screen.pixperdeg);
Screen('Flip', myWindow);
WaitSecs(INFO.P.paradigm_ITI/2);


