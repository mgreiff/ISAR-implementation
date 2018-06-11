% ~~~~~~~~~~~ Copyright (c) 2018 Marcus Greiff (see LICENCE.md) ~~~~~~~~~~~
%
% Runs a constant reference example
%
% The purpose of this example is to illustrate the exponential error bounds
run('init_UAV_model.m')
Tsim = 5;
sequence = 2;

% Define the control signals
ref_A = [pi, pi, pi];  % Amplitude
ref_b = [0, 0, 0];     % Bias
ref_w = [1, 1.5, 2];     % Frequency
ref_p = [1, 2, 3];     % Phase

qr = rand(4,1);
qr(1)=0;
qr = qr./norm(qr);

% Define the time constant in the controller
tau = [0.5,1,1.5];

for ii = 1:length(tau)
    tau_q = tau(ii);
    % Simulate model
    open('example_2_attitude')
    sim('example_2_attitude')

    % Postprocessing and plotting scripts
    figure(2); plot_B(qe, omegac, ii, tau, Tsim)
end