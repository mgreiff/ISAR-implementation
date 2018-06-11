% ~~~~~~~~~~~ Copyright (c) 2018 Marcus Greiff (see LICENCE.md) ~~~~~~~~~~~
%
% Runs a tracking example with the attitude rate control
clear; run('init_UAV_model.m')

% Define the desired reference sequence
sequence = 1;

% Define the control signals in the case of sinusoids
ref_A = 2.* [ 1.0, 1.0, 1.0, 1.0];     % Amplitude
ref_b =     [ 0.0, 0.0, 0.0, 0.0];     % Bias
ref_w = 3.* [ 1.0, 0.0, 1.0, 0.0];     % Frequency
ref_p =     [pi/2, 0.0, 0.0, 0.0];     % Phase

% Define the time constants in the controller
Tsim      = 10;
tau_omega = 0.005;
tau_q     = 0.01;
tau_v     = 0.2;
tau_p     = 0.2;

% Simulate model
open('example_4_full_cascade')
sim('example_4_full_cascade')