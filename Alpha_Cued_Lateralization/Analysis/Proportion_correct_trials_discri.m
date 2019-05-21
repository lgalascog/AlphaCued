clear
path = '/home/busch/Documents/Laurie/Alpha_Cued_Lateralization/Logfiles';
file = '01AH_Logfile.mat';
load(fullfile(path, file))

% Correct proportion for the 2AFC

Only_valid_trials = INFO.T([INFO.T.validity]==1);
Only_invalid_trials = INFO.T([INFO.T.validity]==2);

Proportion_correct_trials = sum([INFO.T.Correct_attention])/INFO.ntrials;
Proportion_correct_trials_valid = sum([Only_valid_trials.Correct_attention])/INFO.ntrials;
Proportion_correct_trials_invalid = sum([Only_invalid_trials.Correct_attention])/INFO.ntrials;



figure();
x = 1:2
data = [Proportion_correct_trials_valid Proportion_correct_trials_invalid]              
b = bar(x,data)

hold on
set(gca,'xticklabel',{'Valid','Invalid'})
b.FaceColor = 'flat';
b.CData(2,:) = [1 0 0];
hold off
