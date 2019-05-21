function Master_Alpha_Cued(Block, sess)
%% Run the AlphaCued experiment
% If Block = 'Train1' --> Run the tutorial trial
% If Block = 'Train2' --> Run 10 slow trials
% If Block = 'Main' --> Run the experiment

% clear
% close all
addpath('./Functions');
addpath('./matlab-input-1.2/hebi'); % added eb 03-May-2019

name  ='01AH';

INFO.name              = name;
INFO.logfilename       = ['./Logfiles/' name '_Logfile.mat'];
INFO.P = get_parameters;

if strcmp(Block, 'Train1')
    AlphaCuedV2_train1
elseif strcmp(Block, 'Train2')
    AlphaCuedV2_train2(INFO, name)
elseif strcmp(Block, 'Main')  
    AlphaCuedV2(INFO, sess, name)
end