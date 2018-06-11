% ~~~~~~~~~~~ Copyright (c) 2018 Marcus Greiff (see LICENCE.md) ~~~~~~~~~~~
%
% Run examlple with constant references
%
% The purpose of this example is to show how the theoretical error bounds
% (red) compared with the true system error in the two norm (black) for 
% various time-constants.
clear; run('init_UAV_model.m'); % Initialize model
Tsim = 5;                       % Set simulation time

% Define the control signals
ref_A = [3, 6, 9];              % Amplitude
ref_b = [0, 0, 0];              % Bias
ref_w = [0, 0, 0];              % Frequency
ref_p = [pi/2, pi/2, pi/2];     % Phase

tau = [0.5, 1.0, 2.0];          % A set of time constants

for ii = 1:length(tau)
    % Define controller
    tau_omega = tau(ii);

    % Simulate model
    open('example_1_attitude_rate')
    sim('example_1_attitude_rate')

    % Plot results
    figure(2); plot_B(omegae, ii, tau, Tsim)
end 