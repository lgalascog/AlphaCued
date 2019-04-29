clear
path = 'C:\Users\galas\Desktop\Alpha cued\Code\Alpha_Cued_Lateralization\Logfiles\';
file = 'Laurie1003_Logfile.mat';
load(fullfile(path, file))

%%
T = INFO.T;
ntrials = length([T.Contrast_probes]);
T = T(1:ntrials);

hit_left  = sum([T.Probes_left] & [T.Correct_probes_left]) / sum([T.Probes_left]);
hit_right = sum([T.Probes_right] & [T.Correct_probes_right]) / sum([T.Probes_right]);
fal_left  = sum([T.Probes_left]==0 & [T.Correct_probes_left]==0) / sum([T.Probes_left]==0);
fal_right = sum([T.Probes_right]==0 & [T.Correct_probes_right]==0) / sum([T.Probes_right]==0);

dp_left = norminv(hit_left) - norminv(fal_left);
dp_right = norminv(hit_right) - norminv(fal_right);