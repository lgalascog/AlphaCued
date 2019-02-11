function INFO = define_trials(INFO)
% 2 pre-cue
% 4 probes
% 2 attention targets with 2 orientations for each : 4
% 2 response-cue
% 2 possible questions sequences
itrial = 0;
for irepeat = 1:INFO.P.paradigm.n_trials; %???
    for ipre_cue = 1:INFO.P.paradigm.pre_cue;
        for iprobes = 1:INFO.P.paradigm.probes;
            for iattention = 1:INFO.P.paradigm.attention;
                for iresponse_cue = 1:INFO.P.paradigm.response_cue;
                    for iquestions = 1:INFO.P.paradigm.questions;
                        itrial = itrial + 1;
                        
                        T(itrial).pre_cue = ipre_cue ;% 50% trials precue left and 50% right
                        T(itrial).probes = iprobes;
                        T(itrial).attention = iattention;
                        T(itrial).response_cue =iresponse_cue ;%? 80% of the time = i.pre_cue but how to do that ?
                        T(itrial).questions = iquestions;
                        
                        T(itrial).button = [];
                        T(itrial).correct = [];
                        T(itrial).rt = [];
                    end
                end
            end
        end
    end
end

INFO.T = Shuffle(T);


%% Done.