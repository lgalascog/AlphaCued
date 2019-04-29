function [INFO, Correct_probes_right,Correct_probes_left, Correct_attention] = response_validity (INFO, itrial)

% Yes/No detection task
if (INFO.T(itrial).probes == 1 & INFO.T(itrial).button_probes_right == 'U')...
        || (INFO.T(itrial).probes == 2 & INFO.T(itrial).button_probes_right == 'D' )...
        || (INFO.T(itrial).probes == 3 & INFO.T(itrial).button_probes_right == 'U' )...        
        || (INFO.T(itrial).probes == 4 & INFO.T(itrial).button_probes_right == 'D' );
    INFO.T(itrial).Correct_probes_right = 1;
else
    INFO.T(itrial).Correct_probes_right = 0;
end

if (INFO.T(itrial).probes == 1 & INFO.T(itrial).button_probes_left == 'D' )...        
        || (INFO.T(itrial).probes == 2 & INFO.T(itrial).button_probes_left == 'U' )...
        || (INFO.T(itrial).probes == 3 & INFO.T(itrial).button_probes_left == 'U' )...        
        || (INFO.T(itrial).probes == 4 & INFO.T(itrial).button_probes_left == 'D' );
     INFO.T(itrial).Correct_probes_left = 1;
else
    
    INFO.T(itrial).Correct_probes_left = 0;
end

Correct_probes_right = INFO.T(itrial).Correct_probes_right;
Correct_probes_left = INFO.T(itrial).Correct_probes_left;



% 2AFC discrimination task
if (INFO.T(itrial).orientation == 1 & INFO.T(itrial).button_attention == 'R')...
        ||(INFO.T(itrial).orientation == 2 & INFO.T(itrial).button_attention == 'L');
        INFO.T(itrial).Correct_attention = 1;
else
    INFO.T(itrial).Correct_attention = 0;
end

Correct_attention = INFO.T(itrial).Correct_attention;

    
    