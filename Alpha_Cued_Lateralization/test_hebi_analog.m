%% test for gamepad
clear all
close all
addpath('./Functions');
% addpath(genpath('matlab-input-1.2')); % added eb 03-May-2019  % commented 27-May
addpath(genpath('./Functions/hebi')); % added eb 27 May to resemble ROSA's call


ntrls = 300;

joy = HebiJoystick(1);


for itrl = 1:ntrls  
    
    sum_butt = 0;
    while sum_butt == 0
        
        buttons = button(joy,1);
        sum_butt = sum(buttons);
        
    end
    
    disp('you pressed a button!')
    
    clear buttons
    
    pause(.1)
    
    
end

close(joy)


