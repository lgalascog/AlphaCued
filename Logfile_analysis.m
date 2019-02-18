%% Logfiles data
%--------------------------------------------------------------------------
% Log files
%--------------------------------------------------------------------------
name = 'test'

INFO.name              = name;
INFO.logfilename       = ['Alpha_Cued_Lateralization/Logfiles/' name '_Logfile.mat'];

load(fullfile('Alpha_Cued_Lateralization\Logfiles\', [name '_Logfile.mat']));
%INFO.T = struct2table(INFO.T);
if name == 'test'
    INFO.T = INFO.T(1:5,:)
end

%--------------------------------------------------------------------------
% Select correct trials
%--------------------------------------------------------------------------



for itrial = 1:height(INFO.T)
    % Probes, Yes/No detection task
    INFO.R_Probes = INFO.T
    if INFO.R_Probes{itrial,'Correct_probes'} == 0
        INFO.R_Probes(itrial,:) = []
        itrial = itrial-1
    end
    % Attention, 2AFC discrimination task
    INFO.R_Attention = INFO.T
    if INFO.R_Attention{itrial,'Correct_attention'} == 0
        INFO.R_Attention(itrial,:) = []
        itrial = itrial-1
    end
    save(INFO.logfilename, 'INFO');
end
        



