clear
path = 'C:\Users\galas\Desktop\Alpha cued\Code\Alpha_Cued_Lateralization\Logfiles\';
file = 'Laurie1003_Logfile.mat';
load(fullfile(path, file))

%%
T = INFO.T; % for shorthand
trials = find([T.Contrast_probes]);
ntrials = length(trials);

%% Probe, Yes/No Detection

% Select trials with probes
probe_l = [T(trials).probes] == 2 | [T(trials).probes] == 3;
probe_r = [T(trials).probes] == 1 | [T(trials).probes] == 3;

% Correct response
probe_l_correct = probe_l & strcmp({T(trials).button_probes_left}, 'U');
probe_r_correct = probe_r & strcmp({T(trials).button_probes_right}, 'U');

% False response
probe_l_error = probe_l & strcmp({T(trials).button_probes_left}, 'D');
probe_r_error = probe_r & strcmp({T(trials).button_probes_right}, 'D');

%% Attention, 2AFC
% Select trials with gabor
attention_clock = [T(trials).orientation] == 1;
attention_cantclock = [T(trials).orientation] == 2;

% Correct response
attention_clock_correct = attention_clock & strcmp({T(trials).button_attention}, 'R');
attention_cantclock_correct = attention_cantclock & strcmp({T(trials).button_attention}, 'L');

% False response
attention_clock_incorrect = attention_clock & strcmp({T(trials).button_attention}, 'L');
attention_cantclock_incorrect = attention_cantclock & strcmp({T(trials).button_attention}, 'R');

%%
figure('color', 'w'); hold all;
title('Quest Probe, Yes/No Detection');
stairs(trials, [T(trials).Contrast_probes]);
plot(trials(probe_l_correct), [T(probe_l_correct).Contrast_probes], 'bo');
plot(0.4+trials(probe_r_correct), [T(probe_r_correct).Contrast_probes], 'ro');
plot(trials(probe_l_error),   [T(probe_l_error).Contrast_probes], 'b.');
plot(0.4+trials(probe_r_error),   [T(probe_r_error).Contrast_probes], 'r.');
legend('contrast','correct left','correct right','error left','error right');
xlabel('Trials') 
ylabel('QUEST estimation threshold, probe color') 

%%
figure('color', 'w'); hold all;
title('Quest Attention, 2AFC');
stairs(trials, [T(trials).Contrast_attention]);
plot(trials(attention_clock_correct), [T(attention_clock_correct).Contrast_attention], 'bo');
plot(0.4+trials(attention_cantclock_correct), [T(attention_cantclock_correct).Contrast_attention], 'ro');
plot(trials(attention_clock_incorrect),   [T(attention_clock_incorrect).Contrast_attention], 'b.');
plot(0.4+trials(attention_cantclock_incorrect),   [T(attention_cantclock_incorrect).Contrast_attention], 'r.');
legend('tilt','correct clock','correct cantclock','error clock','error cantclock');
xlabel('Trials') 
ylabel('QUEST estimation threshold, gabor tilt (rad)') 
