function Master_Alpha_Cued(Block, sess)
%% Run the AlphaCued experiment
% If Block = 'Train1' --> Run the tutorial trial
% If Block = 'Train2' --> Run 10 slow trials
% If Block = 'Main' --> Run the experiment

% clear
% close all
addpath('./Functions');
% addpath(genpath('matlab-input-1.2')); % added eb 03-May-2019  % commented 27-May
addpath(genpath('./Functions/hebi')); % added eb 27 May to resemble ROSA's call


name  ='03EB'; %

INFO.name              = name;

Logfile = fullfile('/home/busch/Documents/Laurie', 'Logfile');
if ~isdir(Logfile)
    mkdir(Logfile)
end

INFO.logfilename       = [Logfile '/' name '_Logfile.mat'];
INFO.P = get_parameters;

if strcmp(Block, 'Train1')
    AlphaCuedV2_train1
elseif strcmp(Block, 'Train2')
    AlphaCuedV2_train2(INFO, name)
elseif strcmp(Block, 'Main')  
    AlphaCuedV2(INFO, sess, name)
end