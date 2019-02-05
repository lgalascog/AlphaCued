% 2 pre-cue
% 4 probes
% 2 attention targets with 2 orientations for each : 4
% 2 response-cue
% 2 possible question sequences

for irepeat = 1:P.paradigm.n_trials
    for iprobes = 1:length(%%%%%%)
        for iattention = 1:P.stim.set_size
            for isequence = 1:size(P.stim.target_color,1)                
                itrial = itrial + 1;
                randorientations = Shuffle(orientations);
                
                T(itrial).probes = iprobes
                T(itrial).iattention = iattention;
                T(itrial). = P.paradigm.soa(isoa);
                T(itrial).orientations = randorientations(1:P.stim.set_size);                
                T(itrial).target_color = P.stim.target_color(icontrast,:);
                
                T(itrial).button = [];
                T(itrial).correct = [];
                T(itrial).rt = [];
                T(itrial).t_trial_on = [];
                T(itrial).t_display_on = [];
                T(itrial).t_display_off = [];
                T(itrial).t_feedback_on = [];
                T(itrial).dur_display = [];
                T(itrial).t_cue_on = [];
            end
        end
    end
end

INFO.T = Shuffle(T);



%% Done.