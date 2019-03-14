%% Logfiles analysis
%--------------------------------------------------------------------------
% Log files
%--------------------------------------------------------------------------
clear all
clc
name = 'test2'

INFO.name              = name;
INFO.logfilename       = ['Alpha_Cued_Lateralization/Logfiles/' name '_Logfile.mat'];
load(fullfile('Alpha_Cued_Lateralization\Logfiles\', [name '_Logfile.mat']));
INFO.T = struct2table(INFO.T);

%--------------------------------------------------------------------------
% Select correct trials
%--------------------------------------------------------------------------

%% Probes, Yes/No detection
% select correct response (right and left both correct)
correctprobesright = cell2mat(INFO.T.Correct_probes_right);
correctprobesleft = cell2mat(INFO.T.Correct_probes_left);
rows_probes_both = correctprobesright & correctprobesleft>0;
INFO.R_Probes_both = INFO.T(rows_probes_both,:);

% Cued trials
cuedtrials =  cell2mat(INFO.R_Probes_both.attention);
rows_probes_cued_trials = cuedtrials<3
INFO.R_Probes_both_cued = INFO.R_Probes_both(rows_probes_cued_trials,:);

% Uncued trials
uncuedtrials =  cell2mat(INFO.R_Probes_both.attention);
rows_probes_uncued_trials = uncuedtrials>2
INFO.R_Probes_both_uncued = INFO.R_Probes_both(rows_probes_uncued_trials,:);



















% Probes, Yes/No detection
correctprobes = cell2mat(INFO.T.Correct_probes);
rows_probes = correctprobes>0;
INFO.R_Probes = INFO.T(rows_probes,:);

% Attention, 2AFC discrimination task
correctattention = cell2mat(INFO.T.Correct_attention);
rows_attention = correctattention>0;
INFO.R_Attention = INFO.T(rows_attention,:);

% Both Probe and attention correct
correctboth = cell2mat(INFO.R_Attention.Correct_probes);
rows_both = correctboth>0;
INFO.R_Both = INFO.R_Attention(rows_both,:);

   

%--------------------------------------------------------------------------
% Mean RT
%--------------------------------------------------------------------------

% Probes correct RT right
% RT Valid
rows_probes_valid = INFO.R_Probes.response_cue<2
INFO.R_Probes_Valid = INFO.R_Probes(rows_probes_valid,:)

RT_right_valid = INFO.R_Probes_Valid.RT_right
RT_right_valid = cell2mat(RT_right_valid)
mean_RT_right_valid = mean(RT_right_valid)
sem_mean_RT_right_valid = std(RT_right_valid)/sqrt(length(RT_right_valid))

% RT Invalid
rows_probes_invalid = INFO.R_Probes.response_cue>1
INFO.R_Probes_Invalid = INFO.R_Probes(rows_probes_invalid,:)

RT_right_invalid = INFO.R_Probes_Invalid.RT_right
RT_right_invalid = cell2mat(RT_right_invalid)
mean_RT_right_invalid = mean(RT_right_invalid)
sem_mean_RT_right_invalid = std(RT_right_invalid)/sqrt(length(RT_right_invalid))

% Probes correct RT left
% RT Valid
RT_left_valid = INFO.R_Probes_Valid.RT_left
RT_left_valid = cell2mat(RT_left_valid)
mean_RT_left_valid = mean(RT_left_valid)
sem_mean_RT_left_valid = std(RT_left_valid)/sqrt(length(RT_left_valid))

% RT Invalid
RT_left_invalid = INFO.R_Probes_Invalid.RT_left
RT_left_invalid = cell2mat(RT_left_invalid)
mean_RT_left_invalid = mean(RT_left_invalid)
sem_mean_RT_left_invalid = std(RT_left_invalid)/sqrt(length(RT_left_invalid))

% Attention correct RT Attention
% RT Valid
rows_attention_valid = INFO.R_Attention.response_cue<2
INFO.R_Attention_Valid = INFO.R_Attention(rows_attention_valid,:)

RT_attention_valid = INFO.R_Attention_Valid.RT_attention
RT_attention_valid = cell2mat(RT_attention_valid)
mean_RT_attention_valid = mean(RT_attention_valid)
sem_mean_RT_attention_valid = std(RT_attention_valid)/sqrt(length(RT_attention_valid))

% RT Invalid
rows_attention_invalid = INFO.R_Attention.response_cue>1
INFO.R_Attention_Invalid = INFO.R_Attention(rows_attention_invalid,:)

RT_attention_invalid = INFO.R_Attention_Invalid.RT_attention
RT_attention_invalid = cell2mat(RT_attention_invalid)
mean_RT_attention_invalid = mean(RT_attention_invalid)
sem_mean_RT_attention_invalid = std(RT_attention_invalid)/sqrt(length(RT_attention_invalid))

% Both correct RT right
% RT Valid
rows_both_valid = INFO.R_Both.response_cue<2
INFO.R_Both_Valid = INFO.R_Both(rows_both_valid,:)

RT_right_both_valid = INFO.R_Both_Valid.RT_right
RT_right_both_valid = cell2mat(RT_right_both_valid)
mean_RT_right_both_valid = mean(RT_right_both_valid)
sem_mean_RT_right_both_valid = std(RT_right_both_valid)/sqrt(length(RT_right_both_valid))

% RT Invalid
bothinvalid = cell2mat(INFO.R_Both.response_cue);
rows_both_invalid = bothinvalid>1
INFO.R_Both_Invalid = INFO.R_Both(rows_probes_invalid,:)

RT_right_both_invalid = INFO.R_Both_Invalid.RT_right
RT_right_both_invalid = cell2mat(RT_right_both_invalid)
mean_RT_right_both_invalid = mean(RT_right_both_invalid)
sem_mean_RT_right_both_invalid = std(RT_right_both_invalid)/sqrt(length(RT_right_both_invalid))

% Both correct RT left
% RT Valid
RT_left_both_valid = INFO.R_Both_Valid.RT_left
RT_left_both_valid = cell2mat(RT_left_both_valid)
mean_RT_left_both_valid = mean(RT_left_both_valid)
sem_mean_RT_left_both_valid = std(RT_left_both_valid)/sqrt(length(RT_left_both_valid))

% RT Invalid
RT_left_both_invalid = INFO.R_Both_Invalid.RT_left
RT_left_both_invalid = cell2mat(RT_left_both_invalid)
mean_RT_left_both_invalid = mean(RT_left_both_invalid)
sem_mean_RT_left_both_invalid = std(RT_left_both_invalid)/sqrt(length(RT_left_both_invalid))

% Both correct RT attention
% RT Valid
RT_attention_both_valid = INFO.R_Both_Valid.RT_attention
RT_attention_both_valid = cell2mat(RT_attention_both_valid)
mean_RT_attention_both_valid = mean(RT_attention_both_valid)
sem_mean_RT_attention_both_valid = std(RT_attention_both_valid)/sqrt(length(RT_attention_both_valid))

% RT Invalid
RT_attention_both_invalid = INFO.R_Both_Invalid.RT_attention
RT_attention_both_invalid = cell2mat(RT_attention_both_invalid)
mean_RT_attention_both_invalid = mean(RT_attention_both_invalid)
sem_mean_RT_attention_both_invalid = std(RT_attention_both_invalid)/sqrt(length(RT_attention_both_invalid))

save(INFO.logfilename, 'INFO');    
%--------------------------------------------------------------------------
% Plots
%--------------------------------------------------------------------------



figure();
% Probes correct RT right
subplot(3,2,1)
title('Probes correct RT right')
A(1:length(RT_right_valid))=1
B(1:length(RT_right_invalid))=2
x =[A B]
y = [RT_right_valid RT_right_invalid]

s = scatter(x,y,'o')
hold on;
% xlim([]);
% ylim([]);
s.LineWidth = 0.6;
s.MarkerEdgeColor = 'k';
e1 = errorbar(1,mean_RT_right_valid,sem_mean_RT_right_valid, 'r o');
e2 = errorbar(2,mean_RT_right_invalid,sem_mean_RT_right_invalid, 'r o');
set(gca, 'XTick', 1:2)
set(gca, 'XTicklabel', {'Valid' 'Invalid'}, 'fontweight', 'bold')
%set(gca, 'YTick', )
e1.LineWidth = 0.6
e1.MarkerEdgeColor = 'r';
e2.LineWidth = 0.6
e2.MarkerEdgeColor = 'r';

% Both correct RT right
subplot(3,2,2)
title('Both correct RT right')
A(1:length(RT_right_both_valid))=1
B(1:length(RT_right_both_invalid))=2
x =[A B]
y = [RT_right_both_valid RT_right_both_invalid]

s = scatter(x,y,'o')
hold on;
% xlim([]);
% ylim([]);
s.LineWidth = 0.6;
s.MarkerEdgeColor = 'k';
e1 = errorbar(1,mean_RT_right_both_valid,sem_mean_RT_right_both_valid, 'r o');
e2 = errorbar(2,mean_RT_right_both_invalid,sem_mean_RT_right_both_invalid, 'r o');
set(gca, 'XTick', 1:2)
set(gca, 'XTicklabel', {'Valid' 'Invalid'}, 'fontweight', 'bold')
%set(gca, 'YTick', )
e1.LineWidth = 0.6
e1.MarkerEdgeColor = 'r';
e2.LineWidth = 0.6
e2.MarkerEdgeColor = 'r';

% Probes correct RT left
subplot(3,2,3)
title('Probes correct RT left')
A(1:length(RT_right_valid))=1
B(1:length(RT_right_invalid))=2
x =[A B]
y = [RT_right_valid RT_right_invalid]

s = scatter(x,y,'o')
hold on;
% xlim([]);
% ylim([]);
s.LineWidth = 0.6;
s.MarkerEdgeColor = 'k';
e1 = errorbar(1,mean_RT_right_valid,sem_mean_RT_right_valid, 'r o');
e2 = errorbar(2,mean_RT_right_invalid,sem_mean_RT_right_invalid, 'r o');
set(gca, 'XTick', 1:2)
set(gca, 'XTicklabel', {'Valid' 'Invalid'}, 'fontweight', 'bold')
%set(gca, 'YTick', )
e1.LineWidth = 0.6
e1.MarkerEdgeColor = 'r';
e2.LineWidth = 0.6
e2.MarkerEdgeColor = 'r';

% Both correct RT left
subplot(3,2,4)
title('Both correct RT left')
A(1:length(RT_left_valid))=1
B(1:length(RT_left_invalid))=2
x =[A B]
y = [RT_left_valid RT_left_invalid]

s = scatter(x,y,'o')
hold on;
% xlim([]);
% ylim([]);
s.LineWidth = 0.6;
s.MarkerEdgeColor = 'k';
e1 = errorbar(1,mean_RT_left_valid,sem_mean_RT_left_valid, 'r o');
e2 = errorbar(2,mean_RT_left_invalid,sem_mean_RT_left_invalid, 'r o');
set(gca, 'XTick', 1:2)
set(gca, 'XTicklabel', {'Valid' 'Invalid'}, 'fontweight', 'bold')
%set(gca, 'YTick', )
e1.LineWidth = 0.6
e1.MarkerEdgeColor = 'r';
e2.LineWidth = 0.6
e2.MarkerEdgeColor = 'r';

% Attention correct RT Attention
subplot(3,2,5)
title('Attention correct RT Attention')
A(1:length(RT_attention_valid))=1
B(1:length(RT_attention_invalid))=2
x =[A B]
y = [RT_attention_valid RT_attention_invalid]

s = scatter(x,y,'o')
hold on;
% xlim([]);
% ylim([]);
s.LineWidth = 0.6;
s.MarkerEdgeColor = 'k';
e1 = errorbar(1,mean_RT_attention_valid,sem_mean_RT_attention_valid, 'r o');
e2 = errorbar(2,mean_RT_attention_invalid,sem_mean_RT_attention_invalid, 'r o');
set(gca, 'XTick', 1:2)
set(gca, 'XTicklabel', {'Valid' 'Invalid'}, 'fontweight', 'bold')
%set(gca, 'YTick', )
e1.LineWidth = 0.6
e1.MarkerEdgeColor = 'r';
e2.LineWidth = 0.6
e2.MarkerEdgeColor = 'r';

% Both correct RT attention
subplot(3,2,6)
title('Both correct RT attention')
A(1:length(RT_attention_both_valid))=1
B(1:length(RT_attention_both_invalid))=2
x =[A B]
y = [RT_attention_both_valid RT_attention_both_invalid]

s = scatter(x,y,'o')
hold on;
% xlim([]);
% ylim([]);
s.LineWidth = 0.6;
s.MarkerEdgeColor = 'k';
e1 = errorbar(1,mean_RT_attention_both_valid,sem_mean_RT_attention_both_valid, 'r o');
e2 = errorbar(2,mean_RT_attention_both_invalid,sem_mean_RT_attention_both_invalid, 'r o');
set(gca, 'XTick', 1:2)
set(gca, 'XTicklabel', {'Valid' 'Invalid'}, 'fontweight', 'bold')
%set(gca, 'YTick', )
e1.LineWidth = 0.6
e1.MarkerEdgeColor = 'r';
e2.LineWidth = 0.6
e2.MarkerEdgeColor = 'r';



