
%%
T = INFO.T; % for shorthand
trials = find([T.Contrast_probes]);
ntrials = length(trials);

probe_l = [T(trials).probes] == 2 | [T(trials).probes] == 3;
probe_r = [T(trials).probes] == 1 | [T(trials).probes] == 3;

probe_l_correct = probe_l & strcmp({T(trials).button_probes_left}, 'UpArrow');
probe_r_correct = probe_r & strcmp({T(trials).button_probes_right}, 'UpArrow');

probe_l_error = probe_l & strcmp({T(trials).button_probes_left}, 'DownArrow');
probe_r_error = probe_r & strcmp({T(trials).button_probes_right}, 'DownArrow');
%%
figure('color', 'w'); hold all
stairs(trials, [T(trials).Contrast_probes])
plot(trials(probe_l_correct), [T(probe_l_correct).Contrast_probes], 'bo')
plot(0.4+trials(probe_r_correct), [T(probe_r_correct).Contrast_probes], 'ro')
plot(trials(probe_l_error),   [T(probe_l_error).Contrast_probes], 'b.')
plot(0.4+trials(probe_r_error),   [T(probe_r_error).Contrast_probes], 'r.')
