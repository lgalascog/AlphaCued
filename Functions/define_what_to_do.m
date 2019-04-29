
function [INFO] = define_what_to_do(INFO)

% Valid trials
Validity = 1;
INFO = define_trials_AlphaCued(INFO, Validity);
sixty_more_valid_rand = randperm(640,60);
sixty_more_valid = INFO.TValid(sixty_more_valid_rand);
INFO.TValid = [INFO.TValid,sixty_more_valid];
for trial = 1:700
INFO.TValid(trial).validity = 1;
trial = trial + 1;
end

% Invalid trials
Validity = 2;
INFO = define_trials_AlphaCued(INFO, Validity);
three_hundred_invalid_rand = randperm(640,300);
INFO.TInvalid = INFO.TInvalid(three_hundred_invalid_rand);
for trial = 1:300
INFO.TInvalid(trial).validity = 2;
trial = trial + 1;
end

INFO.T = [INFO.TValid,INFO.TInvalid];
INFO.T = Shuffle(INFO.T);

for trial = 1:1000
    orientation_rand = randi(2,1000,1);
    INFO.T(trial).orientation = orientation_rand(trial);
    trial = trial + 1;
end    