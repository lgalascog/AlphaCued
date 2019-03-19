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
        
        P.setup.isEYEtrack    = 0;           
        P.setup.isEEG         = 0;
        P.setup.skipsync      = 1;
        P.setup.useCLUT       = 0;
        P.setup.CLUTfile      = 'inverse_CLUT 26 April 2012, 16-48.mat';
        
        case 'BUSCH02'
        
        thescreen = max(Screen('Screens'));
        myres = Screen('Resolution', thescreen);
        
        P.screen.screen_num   = 0 %thescreen;%max(nscreens); 0 is you have only one screen (like a laptop) 1 or 2 if you have multiple screens one is usually the matlab screen
        P.screen.width        = myres.width;
        P.screen.height       = myres.height;
        P.screen.rate         = myres.hz;
        P.screen.size         = [36 27]; %screen size in centimeters.
        P.screen.viewdist     = 55; % distance between subject and monitor
        
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
P.screen.cy = round(P.screen.height/2); % y coordinate of screen center
[P.screen.pixperdeg, P.screen.degperpix] = VisAng(P);
P.screen.pixperdeg = mean(P.screen.pixperdeg);
P.screen.degperpix = mean(P.screen.degperpix);

%% ------------------------------------------------------------------------
% Paradigm : number of possibilities per stimulis
%% ------------------------------------------------------------------------
P.paradigm.n_trials = 1; %Je sais pas du tout ce que ça veut dire donc c'est pas la bonne valeur !
P.paradigm.pre_cue = 2;
P.paradigm.probes = 4;
P.paradigm.attention = 4;
P.paradigm.response_cue = 2;
P.paradigm.questions = 2;

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

P.stim.background_color = [128 128 128];
P.stim.fixation_square_color = [255 255 255]; 
P.stim.fixation_size = 0.3 %(degree)

P.stim.cue_color = [255 255 255];
P.stim.cue_width = 1.3 %(degree)
P.stim.cue_heith = 0.2 %(degree)
P.stim.cue_center_position_1_x = P.screen.cx-100
P.stim.cue_center_position_1_y = P.screen.cy
P.stim.cue_rects_1 = [P.stim.cue_center_position_1_x-P.stim.cue_width/2 * P.screen.pixperdeg; P.stim.cue_center_position_1_y-P.stim.cue_heith/2 * P.screen.pixperdeg; P.stim.cue_center_position_1_x+P.stim.cue_width/2 * P.screen.pixperdeg; P.stim.cue_center_position_1_y+P.stim.cue_heith/2 * P.screen.pixperdeg]
P.stim.cue_center_position_2_x = P.screen.cx+100
P.stim.cue_center_position_2_y = P.screen.cy
P.stim.cue_rects_2 = [P.stim.cue_center_position_2_x-P.stim.cue_width/2 * P.screen.pixperdeg; P.stim.cue_center_position_2_y-P.stim.cue_heith/2 * P.screen.pixperdeg; P.stim.cue_center_position_2_x+P.stim.cue_width/2* P.screen.pixperdeg; P.stim.cue_center_position_2_y+P.stim.cue_heith/2 * P.screen.pixperdeg]


P.text_detection_right = 'Right?';
P.text_detection_left = 'Left?';
P.text_tilt = 'The grating was clockwise or counterclockwise?';


% Detection task (probe)
P.circle_detection_size = 20 % 0.5 * P.screen.pixperdeg %(degree)


% Gratings tilt discrimination task (attention)
%P.grating_tilt_res = 1*[323 323];
P.grating_tilt_phase = 0;
P.grating_tilt_sc = 10.0;
P.grating_tilt_freq = 0.1;
P.grating_tilt_tilt_clock = 350;
P.grating_tilt_tilt_cantclock = 10;% Should be determined by a staircase
%P.grating_tilt_contrast = 100.0;
P.grating_tilt_aspectratio = 1.0;
P.grating_tilt_width = 100 %2 %(degree)
P.grating_tilt_height = 100 %2 %(degree)
%P.grating_tilt_width_pix = P.grating_tilt_width * P.screen.pixperdeg %(pix)
%P.grating_tilt_height_pix = P.grating_tilt_height * P.screen.pixperdeg %(pix)

% Gratings positions
P.radius = 180  %6 %(degree); % Distance between the center of the screen and the grating
P.angles_right = [350 10 30 50 70]; % Angles in degree for the right grating 
P.angles_left = [190 170 150 130 110]; % Angles in degree for the left grating 


%P.radius = P.radius * P.screen.pixperdeg
position_right_x_1 = P.screen.cx + P.radius*cos(P.angles_right(1)*pi/180) ;
position_right_x_2 = P.screen.cx + P.radius*cos(P.angles_right(2)*pi/180) ;
position_right_x_3 = P.screen.cx + P.radius*cos(P.angles_right(3)*pi/180) ;
position_right_x_4 = P.screen.cx + P.radius*cos(P.angles_right(4)*pi/180) ;
position_right_x_5 = P.screen.cx + P.radius*cos(P.angles_right(5)*pi/180) ;

position_right_y_1 = P.screen.cy + P.radius*sin(P.angles_right(1)*pi/180) ;
position_right_y_2 = P.screen.cy + P.radius*sin(P.angles_right(2)*pi/180) ;
position_right_y_3 = P.screen.cy + P.radius*sin(P.angles_right(3)*pi/180) ;
position_right_y_4 = P.screen.cy + P.radius*sin(P.angles_right(4)*pi/180) ;
position_right_y_5 = P.screen.cy + P.radius*sin(P.angles_right(5)*pi/180) ;


position_left_x_1 = P.screen.cx + P.radius*cos(P.angles_left(1)*pi/180) ;
position_left_x_2 = P.screen.cx + P.radius*cos(P.angles_left(2)*pi/180) ;
position_left_x_3 = P.screen.cx + P.radius*cos(P.angles_left(3)*pi/180) ;
position_left_x_4 = P.screen.cx + P.radius*cos(P.angles_left(4)*pi/180) ;
position_left_x_5 = P.screen.cx + P.radius*cos(P.angles_left(5)*pi/180) ;

position_left_y_1 = P.screen.cy + P.radius*sin(P.angles_left(1)*pi/180) ;
position_left_y_2 = P.screen.cy + P.radius*sin(P.angles_left(2)*pi/180) ;
position_left_y_3 = P.screen.cy + P.radius*sin(P.angles_left(3)*pi/180) ;
position_left_y_4 = P.screen.cy + P.radius*sin(P.angles_left(4)*pi/180) ;
position_left_y_5 = P.screen.cy + P.radius*sin(P.angles_left(5)*pi/180) ; 

P.center_right_1 = [position_right_x_1;position_right_y_1];
P.center_right_2 = [position_right_x_2;position_right_y_2];
P.center_right_3 = [position_right_x_3;position_right_y_3];
P.center_right_4 = [position_right_x_4;position_right_y_4];
P.center_right_5 = [position_right_x_5;position_right_y_5];

P.center_left_1 = [position_left_x_1;position_left_y_1];
P.center_left_2 = [position_left_x_2;position_left_y_2];
P.center_left_3 = [position_left_x_3;position_left_y_3];
P.center_left_4 = [position_left_x_4;position_left_y_4];
P.center_left_5 = [position_left_x_5;position_left_y_5];

P.center_right = [P.center_right_1 P.center_right_2 P.center_right_3 P.center_right_4 P.center_right_5];
P.center_left = [P.center_left_1 P.center_left_2 P.center_left_3 P.center_left_4 P.center_left_5];

% Coordinates
P.rects_right_1 = [position_right_x_1-P.grating_tilt_width/2;position_right_y_1-P.grating_tilt_height/2;position_right_x_1+P.grating_tilt_width/2;position_right_y_1+P.grating_tilt_height/2];
P.rects_right_2 = [position_right_x_2-P.grating_tilt_width/2;position_right_y_2-P.grating_tilt_height/2;position_right_x_2+P.grating_tilt_width/2;position_right_y_2+P.grating_tilt_height/2];
P.rects_right_3 = [position_right_x_3-P.grating_tilt_width/2;position_right_y_3-P.grating_tilt_height/2;position_right_x_3+P.grating_tilt_width/2;position_right_y_3+P.grating_tilt_height/2];
P.rects_right_4 = [position_right_x_4-P.grating_tilt_width/2;position_right_y_4-P.grating_tilt_height/2;position_right_x_4+P.grating_tilt_width/2;position_right_y_4+P.grating_tilt_height/2];
P.rects_right_5 = [position_right_x_5-P.grating_tilt_width/2;position_right_y_5-P.grating_tilt_height/2;position_right_x_5+P.grating_tilt_width/2;position_right_y_5+P.grating_tilt_height/2];

P.rects_left_1 = [position_left_x_1-P.grating_tilt_width/2;position_left_y_1-P.grating_tilt_height/2;position_left_x_1+P.grating_tilt_width/2;position_left_y_1+P.grating_tilt_height/2];
P.rects_left_2 = [position_left_x_2-P.grating_tilt_width/2;position_left_y_2-P.grating_tilt_height/2;position_left_x_2+P.grating_tilt_width/2;position_left_y_2+P.grating_tilt_height/2];
P.rects_left_3 = [position_left_x_3-P.grating_tilt_width/2;position_left_y_3-P.grating_tilt_height/2;position_left_x_3+P.grating_tilt_width/2;position_left_y_3+P.grating_tilt_height/2];
P.rects_left_4 = [position_left_x_4-P.grating_tilt_width/2;position_left_y_4-P.grating_tilt_height/2;position_left_x_4+P.grating_tilt_width/2;position_left_y_4+P.grating_tilt_height/2];
P.rects_left_5 = [position_left_x_5-P.grating_tilt_width/2;position_left_y_5-P.grating_tilt_height/2;position_left_x_5+P.grating_tilt_width/2;position_left_y_5+P.grating_tilt_height/2];

P.rects_right = [P.rects_right_1 P.rects_right_2 P.rects_right_3 P.rects_right_4 P.rects_right_5];
P.rects_left = [P.rects_left_1 P.rects_left_2 P.rects_left_3 P.rects_left_4 P.rects_left_5];


%% -----------------------------------------------------------------------
% Parameters of the procedure & timing
%  -----------------------------------------------------------------------

P.paradigm_blank = 0.500;
P.paradigm_precue = 0.120;
P.paradigm_delay = 2.500;
P.paradigm_detection = 0.100;
P.paradigm_delay2 = 0.500
P.paradigm_tilt = 0.200;
P.paradigm_responscue = 0.120;
P.paradigm_delay = 0.500;
P.paradigm_response = 1 %valeur test  %waitforbuttonpress;
P.paradigm_ITI = 2.000;

% P.paradigm_blank = 1
% P.paradigm_precue =2
% P.paradigm_delay = 0
% P.paradigm_detection = 3
% P.paradigm_tilt =0.5
% P.paradigm_responscue = 3
% P.paradigm_delay = 1
% P.paradigm_response = 1 %valeur test  %waitforbuttonpress;
% P.paradigm_ITI = 1

%% ------------------------------------------------------------------------
%  Define relevant buttons
%  ------------------------------------------------------------------------
KbName('UnifyKeyNames');
P.keys.lkey = KbName('LeftArrow');
P.keys.rkey = KbName('RightArrow');
P.keys.yes = KbName('Y');
P.keys.no = KbName('N');

P.location_right_probes = []
P.location_left_probes = []
P.location_right_attention = []
P.location_left_attention = []

% ------------------------------------------------------------------------
% Parameters of the Quest
% ------------------------------------------------------------------------
% Three parameters:
% 1: detection yes/no
% 2: discrimination 2AFC
P.Quest_Guess      = log10([0.35 0.35]);
P.Quest_Std        = [3 3];       % a priori standard deviation of the guess. manual suggests to be generous here
P.Quest_pThreshold = [0.5 0.85];  % threshold criterior for response = 1
P.Quest_beta       = [3.5 3.5];   % slope of psychometric function
P.Quest_delta      = [0.05 0.05]; % p of response = 0 for visible stimuli
P.Quest_gamma      = [0 0.5];     % chance level (for invisible stimuli)

