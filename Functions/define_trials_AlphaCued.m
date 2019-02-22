function INFO = define_trials(INFO)
% 2 pre-cue
% 4 probes
% 2 attention targets with 2 orientations for each : 4
% 2 response-cue
% 2 possible questions sequences
itrial = 0;
for irepeat = 1 :INFO.P.paradigm.n_trials; %???
    for ipre_cue = 1 :INFO.P.paradigm.pre_cue;
        for iprobes = 1 :INFO.P.paradigm.probes;
            for iattention = [1 1 1 1 2 2 2 2 3 4];
                for iresponse_cue = [1 1 1 1 2];
                    for iquestions = 1 :INFO.P.paradigm.questions;
                        itrial = itrial + 1;
                        
                        T(itrial).pre_cue = ipre_cue ;% 50% trials precue left and 50% right
                        T(itrial).probes = iprobes;
                        T(itrial).attention = iattention;
                        T(itrial).response_cue =iresponse_cue ;%? 80% of the time = i.pre_cue but how to do that ?
                        T(itrial).questions = iquestions;
                        
                        T(itrial).Contrast_probes = [];
                        T(itrial).Contrast_attention = [];
                        T(itrial).button_probes_right = [];
                        T(itrial).RT_right = [];
                        T(itrial).button_probes_left = []
                        T(itrial).RT_left = [];
                        T(itrial).button_attention = []
                        T(itrial).RT_attention = [];
                        T(itrial).Correct_probes_right = []
                        T(itrial).Correct_probes_left = []
                        T(itrial).Correct_attention = []
                    end
                end
            end
        end
    end
end



INFO.T = Shuffle(T);


%% Done.