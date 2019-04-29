clear
path = 'C:\Users\galas\Desktop\Alpha cued\Code\Alpha_Cued_Lateralization\Logfiles\';
file = 'Laurie1003_Logfile.mat';
load(fullfile(path, file))

% Correct proportion for the 2AFC

Proportion_correct_trials = sum([INFO.T.Correct_attention])/INFO.ntrials
