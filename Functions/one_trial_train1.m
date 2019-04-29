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

Screen('Drawline', myWindow, INFO.P.stim.cue_color,...
        INFO.P.stim.cue_RIGHT_xPosStart,INFO.P.stim.cue_RIGHT_yPosStart,...
        INFO.P.stim.cue_RIGHT_xPosEnd,INFO.P.stim.cue_RIGHT_yPosEnd,...
        INFO.P.stim.cue_width_pix);
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
% Stimuli
% --------------------------------------------------------
Report2 = 0
while Report2 == 0
    instructions = DrawFormattedText(myWindow, INFO.P.text_instruction_circle,...
        'center', INFO.P.screen.cy-500, [255, 255, 255, 255], [],[],[], 2);
    instructions = DrawFormattedText(myWindow, INFO.P.text_instruction_gabor,...
    'center', INFO.P.screen.cy-300, [255, 255, 255, 255], [],[],[], 2);
    my_optimal_fixationpoint(myWindow, INFO.P.screen.cx, INFO.P.screen.cy,...
        INFO.P.stim.fixation_size, INFO.P.stim.fixation_square_color,...
        INFO.P.stim.background_color, INFO.P.screen.pixperdeg);
    Screen('Flip', myWindow);
    if button(INFO.P.setup.padh,2) == 1
        Report2 = 1
    end
end

gabortex = CreateProceduralGabor(myWindow, INFO.P.grating_tilt_width_pix,...
    INFO.P.grating_tilt_height_pix, [], [0.5 0.5 0.5 0.0]);
set_probe_target(myWindow,INFO, itrial, gabortex) ;

WaitSecs(INFO.P.paradigm_stim_train1);


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


