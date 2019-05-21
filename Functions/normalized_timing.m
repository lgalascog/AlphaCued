function [INFO] = normalized_timing(INFO, itrial)


INFO.P.paradigm_blank_norm = round(INFO.P.paradigm_blank/INFO.P.setup.ITI)*INFO.P.setup.ITI
INFO.P.paradigm_precue_train1_norm = round(INFO.P.paradigm_precue_train1/INFO.P.setup.ITI)*INFO.P.setup.ITI
INFO.P.paradigm_precue_train2_norm = round(INFO.P.paradigm_precue_train2/INFO.P.setup.ITI)*INFO.P.setup.ITI
INFO.P.paradigm_precue_norm = round(INFO.P.paradigm_precue/INFO.P.setup.ITI)*INFO.P.setup.ITI
INFO.P.paradigm_delay_between_cue_and_stim_norm = round(INFO.P.paradigm_delay_between_cue_and_stim/INFO.P.setup.ITI)*INFO.P.setup.ITI
INFO.P.paradigm_stim_train1_norm = round(INFO.P.paradigm_stim_train1/INFO.P.setup.ITI)*INFO.P.setup.ITI
INFO.P.paradigm_stim_train2_norm = round(INFO.P.paradigm_stim_train2/INFO.P.setup.ITI)*INFO.P.setup.ITI
INFO.P.paradigm_stim_norm = round(INFO.P.paradigm_stim/INFO.P.setup.ITI)*INFO.P.setup.ITI
INFO.P.paradigm_delay_before_question_norm = round(INFO.P.paradigm_delay_before_question/INFO.P.setup.ITI)*INFO.P.setup.ITI
INFO.P.paradigm_ITI_norm = round(INFO.P.paradigm_ITI/INFO.P.setup.ITI)*INFO.P.setup.ITI