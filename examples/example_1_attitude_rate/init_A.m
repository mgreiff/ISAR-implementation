% ~~~~~~~~~~~ Copyright (c) 2018 Marcus Greiff (see LICENCE.md) ~~~~~~~~~~~
%
% Runs a tracking example with the attitude rate control.
%
% The purpose of this example is to show how the time-constant affects
% the control signal and behaviour of the system when using a time-varying
% reference. 

clear; run('init_UAV_model.m') % Initialize model
Tsim = 5;                      % Set simulation time

% Define the time constant in the controller
tau_omega = 0.05;              % Time constant

% Define the references in attitude rate ([x, y, z])
ref_A = [10, 10, 10];          % Amplitude
ref_b = [0, 0, 0];             % Bias
ref_w = [1, 2, 3];             % Frequency
ref_p = [1, 2, 3];             % Phase

% Simulate model
open('example_1_attitude_rate')
sim('example_1_attitude_rate')

% Postprocessing and plotting scripts
figure(1); plot_A(omega, omegac, torquec)