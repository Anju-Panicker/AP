%Note
%1. The current folder one the left side should have the following files
%   a) CSI.slx
%   b) fig.m, Inputparameter.m, parseArgs.m, and subaxis.m
%2. Hardware parameters can be modified from Inputparameter.m
%3. Figures are created by the fig.m where the waveforms in the figure can
%   be selected by giving the variables to "ScopeData" at the bottom of this code.

% Run script with input parameters.
% set_param('AIP_Library0123','Lock','off')
clear all
Inputparameter;

% User define parameter
%Switching frequency
Update = 2; %1 means a single update per 18 kHz, 2 means 9 kHz update
Nsw = 18000/fbase;
fTs = Update/18000; % Calculation period (9 kHz)
Window = 360/Update;
iNSampling = 360/Update;
%Internal resistance
Ron1 = 180e-3; %Efficiency 97.5% 43 A/2*9 switches
Ron2 = 90e-3;
% Ron = 10e-3; %Efficiency 97.5% 43 A/2*9 switches
Cout = 100e-12;%output capacitance of IGBT
%Simulation time step
Tdelt = (fTs)/(200*Update);
Tupdate = round(2e-6/Tdelt);
%Total simulation time
Tstop =1.5; 
%Start switching time
tstart = 0.2;
%Dead tim
Tdt = 1.27e-6;
%Three wire=0, four wire = 1
mode = 1;
%DC voltage reference
Tvstep = 1.5;
Vdcref = 650;
fKPUdc = 0.4;%0.4
fKIUdc = 6;
klmt = 0.3;
%PR control gain
Kpr = 0.9*Ibase/(Vbase);%0.9
Qpr = 1.0;
%PLL control gain
Kpll = 20.0;
Kipll = 1.0;
%BPF for feeforward voltage
Qbpf = 1.0;
%Analog LPF cut off frequency
fanalog=7000;
% fanalogv =  7000/2;
%RMS current limit 1= Ibase
Klim = 1.03; 
%Active power and reactive power reference
enb = 0; %Step response at t=0.5 yes = 1, no = 0
Ps = 0;
Qs = 1;
%Number of AIP in parallel
Naip = 1.0;
%Self filtering
self = 1; %1 self filtering, 2 active filtering, 0 no filtering
%Grid harmonics
K5 = 0.0;
K7 = 0.0;
K21 = 0.0;
K120 = 0.0;
%Grid impedance
Sload = 0;
%%SCR = 77 is min for 1 sample, 40 is min for 4 sample for all
%For SCR = 10, fanalog = 7234/2.0 and Q = 0.1
% SCR = 2.2;
XR = 10; %AVG cable 1-2
% Lgrid = (Vbase/sqrt(2))^2/(2*pi*fbase*SCR*((Sbase)/3));
Lgrid = 7.717e-4*10;
Rgrid = 2*pi*fbase*Lgrid/XR;
% Lgrid = 1543e-6;
% Rgrid = 0;
% SCR = (Vbase/sqrt(2))^2/(5*2*pi*fbase*Lgrid*((Sbase)/3));
Cload = 100e-6;
Vmeas_LPF = 1000;

%120 A for hardware 
% Start timer to count the actual time for running the simulation model.
% tic;
% % Run the simul                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ation model.
% sim('CSI_0313_R2017a.slx');
% % % %Input name of variables that needs to be figure
% time_e = 0.5;
% time_s = 0.1;
% VSpace = 0.05; %Space between figures
% ScopeData = dcvoltage;
% ScopeData1 = vacgrid;
% ScopeData2 = zeroseq;
% ScopeData3 = threephasecurrent;
% %Y axis label 
% ScopeData_name = 'DC voltage [V]';
% ScopeData1_name = 'vacgrid [V]';
% ScopeData2_name = 'Zeroseq current [A]';
% ScopeData3_name = 'AIP/total currents [A]';
% % 
% %Execute fig program
% fig