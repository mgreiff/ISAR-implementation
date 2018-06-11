% ~~~~~~~~~~~ Copyright (c) 2018 Marcus Greiff (see LICENCE.md) ~~~~~~~~~~~
%
% Runs a tracking example with the attitude control
clear; run('init_UAV_model.m')
Tsim = 10;
sequence = 1;

% Define the control signals
ref_A = [pi, pi, pi];  % Amplitude
ref_b = [0, 0, 0];     % Bias
ref_w = [1, 1.5, 2];     % Frequency
ref_p = [1, 2, 3];     % Phase

qr = rand(4,1);
qr(1)=0;
qr = qr./norm(qr);

% Define the time constant in the controller
tau_q = 0.05;

% Simulate model
open('example_2_attitude')
sim('example_2_attitude')

% Postprocessing and plotting scripts
figure(1); plot_A(q, qc, omegac, state, SO3metric)