clear
close all
addpath('./Functions');
addpath('./results');
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

counter = 1
Number_of_trials = INFO.P.number_trials
while counter < Number_of_trials
    n_trials = counter
    % Set the screen
    Screen('Preference', 'SkipSyncTests', INFO.P.setup.skipsync); %Skip or not synchronization test
    Screen('Resolution', INFO.P.screen.screen_num, INFO.P.screen.width, ... %Set parameters of the screen
        INFO.P.screen.height, INFO.P.screen.rate);
    
    
    % Create the background
    gray = GrayIndex(INFO.P.screen.screen_num);
    [myWindow, windowRect] = PsychImaging('OpenWindow', INFO.P.screen.screen_num, gray);%Open the screen and set the grey color / There ise a problem but I don't know how to use INFO.P.stim.background_color
    
    % Display square fixation
    Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_square_position); %Add square fixation
    Screen('Flip', myWindow);
    
    WaitSecs('UntilTime', INFO.P.paradigm_blank)
    
    % Display the cue
    Alea_Var_1 = rand
    
    if Alea_Var_1 < 0.5
        Screen ('FillRect', myWindow,INFO.P.stim.cue_color,INFO.P.stim.cue_positions_1)
        Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_square_position);
        Screen('Flip', myWindow);
        'Left'
    else
        Screen ('FillRect', myWindow,INFO.P.stim.target_color,INFO.P.stim.cue_positions_2)
        Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_square_position);
        Screen('Flip', myWindow);
        'right'
    end
    
    WaitSecs('UntilTime', INFO.P.paradigm_precue)
    
    % Remove the cue
    Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_square_position); %Add square fixation
    Screen('Flip', myWindow);
    
    WaitSecs('UntilTime', INFO.P.paradigm_delay)
    
    %% Create discrimination  (detection probes)
    
    % Select one right position (between all possible angles)
    nX = numel(INFO.P.angles_right);
    idx = randperm(1);
    angle_tilt_right = INFO.P.angles_right(idx(1:1))
    
    % Select one left position (between all possible angles)
    nX = numel(INFO.P.angles_left);
    idx = randperm(1);
    angle_tilt_left = INFO.P.angles_left(idx(1:1))
    
    % Put a grating on the right side
    %gabortex = CreateProceduralGabor(myWindow, INFO.P.screen.cx,INFO.P.screen.cy, [], [0.5 0.5 0.5 0.0]);
    gabortex = CreateProceduralGabor(myWindow, INFO.P.screen.cx+INFO.P.radius*cos(angle_right*pi/180),... 
        INFO.P.screen.cy+INFO.P.radius*sin(angle_right*pi/180), [], [0.5 0.5 0.5 0.0]);
    Screen('DrawTexture', myWindow, gabortex, [], [], INFO.P.grating_tilt_tilt, [], [], [], [], kPsychDontDoRotation,...
        [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
        INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
    Screen('Flip', myWindow);
    
    % Put a grating on the left side
    gabortex = CreateProceduralGabor(myWindow, INFO.P.screen.cx+INFO.P.radius*cos(angle_tilt_left*pi/180),...
        INFO.P.screen.cy+INFO.P.radius*sin(angle_tilt_left*pi/180), [], [0.5 0.5 0.5 0.0]);
    Screen('DrawTexture', myWindow, gabortex, [], [], INFO.P.grating_tilt_tilt, [], [], [], [], kPsychDontDoRotation,...
        [INFO.P.grating_tilt_phase+180, INFO.P.grating_tilt_freq, INFO.P.grating_tilt_sc,...
        INFO.P.grating_tilt_contrast, INFO.P.grating_tilt_aspectratio, 0, 0, 0]);
    
    Screen('Flip', myWindow);
    
    %% Create Detection Grating (attention target)
    
    % Select one right position
    nX = numel(INFO.P.angles_right);
    idx = randperm(1);
    angle_detection_right = INFO.P.angles_right(idx(1:1))
    
    % Select one left position
    nX = numel(INFO.P.angles_left);
    idx = randperm(1);
    angle_detection_left = INFO.P.angles_left(idx(1:1))
    
    % Change selection if gabor are at the same location
    if angle_detection_right == angle_tilt_right
        while angle_detection_right == angle_tilt_right
            nX = numel(INFO.P.angles_right);
            idx = randperm(1);
            angle_detection_right = INFO.P.angles_right(idx(1:1))
            break;
        end
    end
    
    if angle_detection_left == angle_tilt_left
        while angle_detection_left == angle_tilt_left
            nX = numel(INFO.P.angles_left);
            idx = randperm(1);
            angle_detection_left = INFO.P.angles_left(idx(1:1))
            break;
        end
    end
    
    % Put a grating on the right side
    % gabortex = CreateProceduralGabor(myWindow, INFO.P.screen.cx,INFO.P.screen.cy, [], [0.5 0.5 0.5 0.0]);
    gabortex = CreateProceduralGabor(myWindow, INFO.P.screen.cx+INFO.P.radius*cos(angle_right*pi/180),...
        INFO.P.screen.cy+INFO.P.radius*sin(angle_right*pi/180), [], [0.5 0.5 0.5 0.0]);
    Screen('DrawTexture', myWindow, gabortex, [], [], INFO.P.grating_detection_tilt, [], [], [], [], kPsychDontDoRotation,...
        [INFO.P.grating_detection_phase+180, INFO.P.grating_detection_freq, INFO.P.grating_detection_sc,...
        INFO.P.grating_detection_contrast, INFO.P.grating_detection_aspectratio, 0, 0, 0]);
    Screen('Flip', myWindow);
    
    % Put a grating on the left side
    gabortex = CreateProceduralGabor(myWindow, INFO.P.screen.cx+INFO.P.radius*cos(angle_left*pi/180),...
        INFO.P.screen.cy+INFO.P.radius*sin(angle_left*pi/180), [], [0.5 0.5 0.5 0.0]);
    Screen('DrawTexture', myWindow, gabortex, [], [], INFO.P.grating_detection_tilt, [], [], [], [], kPsychDontDoRotation,...
        [INFO.P.grating_detection_phase+180, INFO.P.grating_detection_freq, INFO.P.grating_detection_sc,...
        INFO.P.grating_detection_contrast, INFO.P.grating_detection_aspectratio, 0, 0, 0]);
    
    Screen('Flip', myWindow);
    
    
    % Display the post cue
    Alea_Var_2 = rand
    if Alea_Var_2 < 0.75
        Alea_Var_2 = Alea_Var_1 %75% of time at the same location than the firs one
    end
    
    if Alea_Var_2 < 0.5
        Screen ('FillRect', myWindow,INFO.P.stim.target_color,INFO.P.stim.target_positions_1)
        Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_square_position);
        Screen('Flip', myWindow);
        'Left'
    else
        Screen ('FillRect', myWindow,INFO.P.stim.target_color,INFO.P.stim.target_positions_2)
        Screen('FillRect', myWindow, INFO.P.stim.fixation_square_color, INFO.P.stim.fixation_square_position);
        Screen('Flip', myWindow);
        'right'
    end
    
    
    WaitSecs('UntilTime', INFO.P.paradigm_responscue+INFO.P.paradigm_delay)
    
    %% Questions
    % Which question first
    Alea_Var = rand
    
    % Question about detection of the noisi gabor
    if Alea_Var < 0.5
        Detection_gabor_left = DrawFormattedText(myWindow, INFO.P.text_detection_left, 'center', INFO.P.screen.cy-100, [255, 255, 255, 255]);
        Screen('Flip', myWindow);
        [keyIsDown, timeSecs, keyCode ] = KbCheck;
        keyCode = find(keyCode, 1);
        startSecs = GetSecs;
        
        if keyIsDown
            Reaction_time_gabor_left = timeSecs - startSecs
            Key_pressed_gabor_left = KbName(keyCode)
        end
        Detection_gabor_right = DrawFormattedText(myWindow, INFO.P.text_detection_right, 'center', INFO.P.screen.cy-100, [255, 255, 255, 255]);
        Screen('Flip', myWindow);
        [keyIsDown, timeSecs, keyCode ] = KbCheck;
        keyCode = find(keyCode, 1);
        startSecs = GetSecs;
        
        if keyIsDown
            Reaction_time_gabor_right = timeSecs - startSecs
            Key_pressed_gabor_right = KbName(keyCode)
        end
        
        KbStrokeWait;
    else
        Detection_gabor_right = DrawFormattedText(myWindow, INFO.P.text_detection_right, 'center', INFO.P.screen.cy-100, [255, 255, 255, 255]);
        Screen('Flip', myWindow);
        KbStrokeWait;
        [keyIsDown, timeSecs, keyCode ] = KbCheck;
        keyCode = find(keyCode, 1);
        startSecs = GetSecs;
        
        if keyIsDown
            Reaction_time_gabor_right = timeSecs - startSecs
            Key_pressed_gabor_right = KbName(keyCode)
        end
        
        Detection_gabor_left = DrawFormattedText(myWindow, INFO.P.text_detection_left, 'center', INFO.P.screen.cy-100, [255, 255, 255, 255]);
        Screen('Flip', myWindow);
        [keyIsDown, timeSecs, keyCode ] = KbCheck;
        keyCode = find(keyCode, 1);
        startSecs = GetSecs;
        
        if keyIsDown
            Reaction_time_gabor_left = timeSecs - startSecs
            Key_pressed_gabor_left = KbName(keyCode)
        end
        KbStrokeWait;
    end
    
    % Question for the tilted Gabor
    Tilt_gabor = DrawFormattedText(myWindow, INFO.P.text_tilt, 'center', INFO.P.screen.cy-100, [255, 255, 255, 255]);
    Screen('Flip', myWindow);
    [keyIsDown, timeSecs, keyCode ] = KbCheck;
    keyCode = find(keyCode, 1);
    startSecs = GetSecs;
    
    if keyIsDown
        Reaction_time_tilt_gabor = timeSecs - startSecs
        Key_pressed_tilt_gabor = KbName(keyCode)
    end
    
    trials = make_trials_struct(n_trials, Reaction_time_gabor_left, Key_pressed_gabor_left, Reaction_time_gabor_right, Key_pressed_gabor_right, Reaction_time_tilt_gabor, Key_pressed_tilt_gabor);
    % I need to this part :data recording
    counter = counter+1
    
end
%save([indir 'M2/Alpha_Cued_Lateralization/Results/' num2str(name) '/log_files/Reaction_time_s' num2str(name) '.mat'], '');
KbStrokeWait;
sca;


