function Master_Alpha_Cued(Block)
%% Run the AlphaCued experiment
% If Block = 'Train1' --> Run the tutorial trial
% If Block = 'Train2' --> Run 10 slow trials
% If Block = 'Main' --> Run the experiment

if Block == 'Train1'
    AlphaCuedV2_train1
elseif Block == 'Train2'
    AlphaCuedV2_train2
elseif Block = 'Main' 
    AlphaCuedV2
end