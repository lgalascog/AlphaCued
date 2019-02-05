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
P.screen.cy = round(P.screen.height/2); % y coordinate of screen center

%% ------------------------------------------------------------------------
% Paradigm : number of possibilities per stimulis
%% ------------------------------------------------------------------------
P.paradigm.n_trials = 2 %Je sais pas du tout ce que ça veut dire donc c'est pas la bonne valeur !
P.paradigm.pre_cue = 2
P.paradigm.probes = 4
P.paradigm.attention = 4
P.paradigm.response_cue = 2
P.paradigm.questions = 2

%% ------------------------------------------------------------------------
% Select th number of trials
%% ------------------------------------------------------------------------
P.number_trials = 1

%% -----------------------------------------------------------------------
% Parameters of the display and stimuli
% ------------------------------------------------------------------------

P.stim.background_color = [128 128 128];

P.stim.fixation_square_color = [255 255 255]; 
P.stim.fixation_square_size = [0 0 10 10]; %should I use the program VisAng and put all dimensions in degree ?
P.stim.fixation_square_position = CenterRectOnPointd(P.stim.fixation_square_size, P.screen.cx, P.screen.cy);

P.stim.target_color = [255 255 255];
P.stim.target_size = [0 0 50 10];
P.stim.target_positions_1 = CenterRectOnPointd(P.stim.target_size, P.screen.cx-100, P.screen.cy);
P.stim.target_positions_2 = CenterRectOnPointd(P.stim.target_size, P.screen.cy+500, P.screen.cy);

P.target_left_positions =1; %valeur test  % 5 possible positions
P.target_right_positions =1; %valeur test  % 5 possible positions

P.text_detection_right = 'Did you see a grating on the left side of the screen';
P.text_detection_left = 'Did you see a grating on the right side of the screen';
P.text_tilt = 'The grating was clockwise or counterclockwise ?';
 


% Gratings detection task
P.grating_detection_res = 1*[323 323];
P.grating_detection_phase = 0;
P.grating_detection_sc = 40.0;
P.grating_detection_freq = .03;
P.grating_detection_tilt = 50; % Should be determined by a staircase
P.grating_detection_contrast = 100.0;
P.grating_detection_aspectratio = 1.0;

% Gratings tilt discrimination task
P.grating_tilt_res = 1*[323 323];
P.grating_tilt_phase = 0;
P.grating_tilt_sc = 50.0;
P.grating_tilt_freq = .1;
P.grating_tilt_tilt = 50; % Should be determined by a staircase
P.grating_tilt_contrast = 100.0;
P.grating_tilt_aspectratio = 1.0;

% Gratings positions
P.radius = 10 % Distance between the center of the screen and the grating
P.angles_right = [20 -20 -40 -60 -80] % Angles in degree for the right grating 
P.angles_left = [160 200 220 240 260] % Angles in degree for the left grating 

% P.grating_cx_R_1 = P.screen.cx+200*cos(0.1)
% P.grating_cy_R_1 = P.screen.cy+200*sin(0.1)
% P.grating_positions_R_1 = CenterRectOnPointd(P.grating_detection_res, P.screen.cx+200*cos(20), P.screen.cy+200*sin(20));
% P.grating_positions_R_2 = CenterRectOnPointd(P.grating_detection_res, P.screen.cx+200*cos(-20), P.screen.cy+200*sin(-20));
% P.grating_positions_R_3 = CenterRectOnPointd(P.grating_detection_res, P.screen.cx+200*cos(-40), P.screen.cy+200*sin(-40));
% P.grating_positions_R_4 = CenterRectOnPointd(P.grating_detection_res, P.screen.cx+200*cos(-60), P.screen.cy+200*sin(-60));
% P.grating_positions_R_5 = CenterRectOnPointd(P.grating_detection_res, P.screen.cx+200*cos(-80), P.screen.cy+200*sin(-80));

%% -----------------------------------------------------------------------
% Parameters of the procedure & timing
%  -----------------------------------------------------------------------

P.paradigm_blank = 500;
P.paradigm_precue = 100;
P.paradigm_delay = 1500;
P.paradigm_detection = 100;
P.paradigm_tilt = 20;
P.paradigm_responscue = 500;
P.paradigm_delay = 500;
P.paradigm_response = 1 %valeur test  %waitforbuttonpress;
P.paradigm_ITI = 2000;



%% ------------------------------------------------------------------------
%  Define relevant buttons
%  ------------------------------------------------------------------------
KbName('UnifyKeyNames');
P.keys.lkey = KbName('LeftArrow');
P.keys.rkey = KbName('RightArrow');
P.keys.yes = KbName('Y');
P.keys.no = KbName('N');



