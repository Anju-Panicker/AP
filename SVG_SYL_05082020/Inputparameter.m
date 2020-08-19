clear all
clc

%Pre charging resistor value
Rpre = 2.2;
%DC capacitor
Cdc = 4.76*10^-3;
%EMC filter 
Cemc = 1.5e-6;
Remc = 1e-3;
%Line filter
Lline = 60e-6;
Rline = 4.95e-3;
%PWM filter
Lpwm = 184.8e-6;
Rpwm = 6.2e-3;
%Filter capacitor
C = 12e-6;
Rc = 10e-3;
% Rc = 1e-3;
%Battery internal impedance
Rbattery = 10e-3;
%Base value
Vbase = 400*sqrt(2/3);
Ibase = 43*sqrt(2);
Sbase = 30000;
fbase = 50;
