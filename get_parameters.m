function [P] = get_parameters;

%% ------------------------------------------------------------------------
% Set the computer-specific parameters.
%  ------------------------------------------------------------------------
computername = getenv('COMPUTERNAME');
switch computername
    case 'LAURIE'
        
        thescreen = max(Screen('Screens'));
        myres = Screen('Resolution', thescreen);
        
        P.screen.screen_num   = thescreen;%max(nscreens); 0 is you have only one screen (like a laptop) 1 or 2 if you have multiple screens one is usually the matlab screen
        P.screen.width        = myres.width;
        P.screen.height       = myres.height;
        P.screen.rate         = myres.hz;
        P.screen.size         = [28.8 16.2]; %screen size in centimeters.
        P.screen.viewdist     = 55; % distance between subject and monitor
        
        P.setup.isPad         = 0 
        P.setup.isEYEtrack    = 0;        
        P.setup.isEEG         = 0;
        P.setup.skipsync      = 1;
        P.setup.useCLUT       = 0;
        P.setup.CLUTfile      = 'inverse_CLUT 26 April 2012, 16-48.mat';
        
    case 'BUSCH03'
        
        thescreen = max(Screen('Screens'));
        myres = Screen('Resolution', thescreen);
        
        P.screen.screen_num   = thescreen;%max(nscreens); 0 is you have only one screen (like a laptop) 1 or 2 if you have multiple screens one is usually the matlab screen
        P.screen.width        = myres.width;
        P.screen.height       = myres.height;
        P.screen.rate         = myres.hz;
        P.screen.size         = [36 27]; %screen size in centimeters.
        P.screen.viewdist     = 55; % distance between subject and monitor
        
        P.setup.isPad         = 1
        P.setup.isEYEtrack    = 0;           
        P.setup.isEEG         = 0;
        P.setup.skipsync      = 1;
        P.setup.useCLUT       = 0;
        P.setup.CLUTfile      = 'inverse_CLUT 26 April 2012, 16-48.mat';
        
        case 'BUSCH02'
        
        thescreen = max(Screen('Screens'));
        myres = Screen('Resolution', thescreen);
        
        P.screen.screen_num   = thescreen;%max(nscreens); 0 is you have only one screen (like a laptop) 1 or 2 if you have multiple screens one is usually the matlab screen
        P.screen.width        = myres.width;
        P.screen.height       = myres.height;
        P.screen.rate         = myres.hz;
        P.screen.size         = [36 27]; %screen size in centimeters.
        P.screen.viewdist     = 55; % distance between subject and monitor
        
        P.setup.isPad         = 0
        P.setup.isEYEtrack    = 0;           
        P.setup.isEEG         = 0;
        P.setup.skipsync      = 1;
        P.setup.useCLUT       = 0;
        P.setup.CLUTfile      = 'inverse_CLUT 26 April 2012, 16-48.mat';
end



%% ------------------------------------------------------------------------
%  Parameters of the screen.
%  Calculate size of a pixel in visual angles.
% ------------------------------------------------------------------------
P.screen.cx = round(P.screen.width/2); % x coordinate of screen center
P.CenterX = P.screen.cx %
P.screen.cy = round(P.screen.height/2); % y coordinate of screen center
P.CenterY = P.screen.cy %
[P.screen.pixperdeg, P.screen.degperpix] = VisAng(P);
P.screen.pixperdeg = mean(P.screen.pixperdeg);
P.screen.degperpix = mean(P.screen.degperpix);

%% ------------------------------------------------------------------------
% Paradigm : number of possibilities per stimulis
%% ------------------------------------------------------------------------
P.paradigm.n_trials = 1; %Je sais pas du tout ce que �a veut dire donc c'est pas la bonne valeur !
P.paradigm.pre_cue = 2;
P.paradigm.probes = 4;
P.paradigm.attention = 4;
P.paradigm.response_cue = 42;
P.paradigm.questions = 2;


%% -----------------------------------------------------------------------
% Parameters of the procedure & timing
%  -----------------------------------------------------------------------

P.paradigm_blank = 0.500;
P.paradigm_precue_train1 = 2;
P.paradigm_precue = 0.120;
P.paradigm_delay_between_cue_and_stim = 2.500;
P.paradigm_detection_train1 = 2;
P.paradigm_detection = 0.100;
P.paradigm_tilt_train1 = 2;
P.paradigm_tilt = 0.200;
P.paradigm_delay_before_question = 0.500;
P.paradigm_ITI = 2.000;


%% ------------------------------------------------------------------------
% Eyetracking parameters
%% ------------------------------------------------------------------------
P.WaitAfterButtonPress = 0.500

P.TriggerDuration       = 0.005;
P.TriggerStartRecording = 250;
P.TriggerStopRecording  = 251;



%% -----------------------------------------------------------------------
% Parameters of the display and stimuli
% ------------------------------------------------------------------------

% Background
P.stim.background_color = [128 128 128];
P.BgColor = P.stim.background_color;

%Fixation square
P.stim.fixation_square_color = [255 255 255]; 
P.stim.fixation_size = 0.3; %(degree)

%Cue
P.stim.cue_color = [255 255 255];
P.stim.cue_width = 1.3 %(degree)
P.stim.cue_heith = 0.2 %(degree)
P.stim.cue_center_position_1_x = P.screen.cx-100;
P.stim.cue_center_position_1_y = P.screen.cy;
P.stim.cue_rects_1 = [P.stim.cue_center_position_1_x-P.stim.cue_width/2* P.screen.pixperdeg;...
    P.stim.cue_center_position_1_y-P.stim.cue_heith/2* P.screen.pixperdeg;...
    P.stim.cue_center_position_1_x+P.stim.cue_width/2* P.screen.pixperdeg;...
    P.stim.cue_center_position_1_y+P.stim.cue_heith/2* P.screen.pixperdeg];
P.stim.cue_center_position_2_x = P.screen.cx+100;
P.stim.cue_center_position_2_y = P.screen.cy;
P.stim.cue_rects_2 = [P.stim.cue_center_position_2_x-P.stim.cue_width/2* P.screen.pixperdeg;...
    P.stim.cue_center_position_2_y-P.stim.cue_heith/2* P.screen.pixperdeg;...
    P.stim.cue_center_position_2_x+P.stim.cue_width/2* P.screen.pixperdeg;...
    P.stim.cue_center_position_2_y+P.stim.cue_heith/2 * P.screen.pixperdeg];


% Detection task (probe)
P.circle_detection_size = 0.4 %(degree)
P.circle_detection_size_pix = round(P.circle_detection_size * P.screen.pixperdeg); %(pix) 


% Gratings tilt discrimination task (attention)
P.grating_tilt_phase = 0;
P.grating_tilt_sc = 10.0;
P.grating_tilt_freq = 0.1;
P.grating_tilt_tilt_clock = 350;
P.grating_tilt_tilt_cantclock = 10;% Should be determined by a staircase
P.grating_tilt_contrast = 15;
P.grating_tilt_aspectratio = 1.0;
P.grating_tilt_width = 2 %(degree)
P.grating_tilt_height = 2 %(degree)
P.grating_tilt_width_pix = round(P.grating_tilt_width * P.screen.pixperdeg) %(pix)
P.grating_tilt_height_pix = round(P.grating_tilt_height * P.screen.pixperdeg) %(pix)

% Stimuli position
P.n_positions = 5;
P.radius_deg = 4; %(degree); % Distance between the center of the screen and the grating
P.radius_px = P.radius_deg * P.screen.pixperdeg; %pix

P.angles(1,:) = linspace(91, 179, P.n_positions);
P.angles(2,:) = linspace(1, 89, P.n_positions);
for ipos = 1:P.n_positions
    for iside = 1:2        
        P.position(iside, ipos, 1) = P.screen.cx + P.radius_px*cosd(P.angles(iside, ipos)) ;
        P.position(iside, ipos, 2) = P.screen.cy + P.radius_px*sind(P.angles(iside, ipos)) ;
    end
end

%% ------------------------------------------------------------------------
%  Text
%  ------------------------------------------------------------------------

P.text_instruction_cue = 'In a moment, a rectangle will appear on the screen. \n This shape gives you the place where you need to focus your attention. \n If the rectangle appears on the right side, you have to pay attention to the right side of the screen. \n If it appears on the left, you have to pay attention to the left. \n Take care to never move your eyes, during the trials, your gaze must remain fixed on the cross in center of the screen.\n Press the spacebar to continue.';
P.text_instruction_circle = 'Then, circles will appear on the lower part of the screen \n One white circle can appear on each side of the screen \n You have to remember where the circles appear. On the right, on the left or both? \n Press the spacebar to continue';
P.text_instruction_gabor = 'Then, a gabor will appear on the right OR on the left side of the screen. \n 80% of the time, the gabor will appear where you have to pay attention. \n That is why it is important to pay attention to the previously indicated location. \n This gabor will be tilted to the right or to the left. \n You have to remember the orientation of the gabor. To the right or to the left \n Press the spacebar to continue.';
P.text_instruction_report_left = 'At the end, you will have to report your responses. \n If you saw a circle on the left side of the screen: Press the up button of the left cross \n If you did not see a circle on the left side of the screen: Press the down button of the left cross.';
P.text_instruction_report_right = 'If you saw a circle on the right side of the screen: Press the Y button on the right side of the gamepad \n If you did not see a circle on the rifgt side of the screen: Press the A button on the right side of the gamepad.';
P.text_instruction_report_tilt = 'If the gabor was tilted to the left: press the LB button. \n If the gabor was tilted to the right: press the RB button.';
    
    
P.text_questions = '?';


%% ------------------------------------------------------------------------
%  Define gamepad buttons
%  ------------------------------------------------------------------------
joy = HebiJoystick(1);
P.setup.padh = joy;

% ------------------------------------------------------------------------
% Parameters of the Quest
% ------------------------------------------------------------------------
% Three parameters:
% 1: detection yes/no
% 2: discrimination 2AFC
P.Quest_Guess      = log10([0.35 0.3491]); %second value in radians
P.Quest_Std        = [3 3];       % a priori standard deviation of the guess. manual suggests to be generous here
P.Quest_pThreshold = [0.5 0.85];  % threshold criterior for response = 1
P.Quest_beta       = [3.5 3.5];   % slope of psychometric function
P.Quest_delta      = [0.05 0.05]; % p of response = 0 for visible stimuli
P.Quest_gamma      = [0 0.5];     % chance level (for invisible stimuli)

