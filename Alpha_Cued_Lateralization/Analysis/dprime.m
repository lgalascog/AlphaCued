clear
path = '/home/busch/Documents/Laurie/Alpha_Cued_Lateralization/Logfiles';
file = '01AH_Logfile.mat';
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

Only_valid_trials = INFO.T([INFO.T.validity]==1);
Only_invalid_trials = INFO.T([INFO.T.validity]==2);

hit_left_valid = sum([Only_valid_trials.Probes_left] & [Only_valid_trials.Correct_probes_left]) / sum([Only_valid_trials.Probes_left]);
hit_left_invalid = sum([Only_invalid_trials.Probes_left] & [Only_invalid_trials.Correct_probes_left]) / sum([Only_invalid_trials.Probes_left]);
hit_right_valid = sum([Only_valid_trials.Probes_right] & [Only_valid_trials.Correct_probes_right]) / sum([Only_valid_trials.Probes_right]);
hit_right_invalid = sum([Only_invalid_trials.Probes_right] & [Only_invalid_trials.Correct_probes_right]) / sum([Only_invalid_trials.Probes_right]);

fal_left_valid  = sum([Only_valid_trials.Probes_left]==0 & [Only_valid_trials.Correct_probes_left]==0) / sum([Only_valid_trials.Probes_left]==0);
fal_left_invalid  = sum([Only_invalid_trials.Probes_left]==0 & [Only_invalid_trials.Correct_probes_left]==0) / sum([Only_invalid_trials.Probes_left]==0);
fal_right_valid = sum([Only_valid_trials.Probes_right]==0 & [Only_valid_trials.Correct_probes_right]==0) / sum([Only_valid_trials.Probes_right]==0);
fal_right_invalid = sum([Only_invalid_trials.Probes_right]==0 & [Only_invalid_trials.Correct_probes_right]==0) / sum([Only_invalid_trials.Probes_right]==0);

dp_left_valid = norminv(hit_left_valid) - norminv(fal_left_valid);
dp_left_invalid = norminv(hit_left_invalid) - norminv(fal_left_invalid);
dp_right_valid = norminv(hit_right_valid) - norminv(fal_right_valid);
dp_right_invalid = norminv(hit_right_invalid) - norminv(fal_right_invalid); 

figure();
subplot(1, 2, 1);
x1 = 1:2
data1 = [dp_left_valid dp_left_invalid]              
a = bar(x1,data1)

hold on
set(gca,'xticklabel',{'Valid','Invalid'})
a.FaceColor = 'flat';
a.CData(2,:) = [1 0 0];
hold off

subplot(1, 2, 2);
x2 = 1:2
data2 = [dp_right_valid dp_right_invalid]              
b = bar(x2,data2)

hold on
set(gca,'xticklabel',{'Valid','Invalid'})
b.FaceColor = 'flat';
b.CData(2,:) = [1 0 0];
hold off
