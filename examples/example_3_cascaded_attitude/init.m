% ~~~~~~~~~~~ Copyright (c) 2018 Marcus Greiff (see LICENCE.md) ~~~~~~~~~~~
%
% Runs a tracking example with the attitude rate control
clear; run('init_UAV_model.m')
Tsim = 20;

% Define the time constant in the controller
tau_omega = 0.01;
tau_q     = 0.05;

% Define the control signals
ref_A = [4, 4, 4];  % Amplitude
ref_b = [0, 0, 0];     % Bias
ref_w = [1, 1.1, 1.2];     % Frequency
ref_p = [1, 2, 3];     % Phase

% Simulate model
open('example_3_cascaded_attitude')
sim('example_3_cascaded_attitude')

%% Define the time constant in the controller
for n = 1:2
    style = {'-', '--',':','-.'};
    if n == 1
        valuesA = [0.1,1,1.5,2];
        valuesB = [1];
    else
        valuesA = [1];
        valuesB = [0.1,1,1.5,2];
    end
    omega0 = rand(3,1);
    omega0 = 1.*omega0./norm(omega0);
    q_c = [0;rand(3,1)];
    q_c = q_c./norm(q_c);

    TT = [4, 30; 30, 60];
    for ii = 1:length(valuesA)
        for jj = 1:length(valuesB)
            Tsim = 20;
            tau_omega = valuesA(ii);
            tau_q     = valuesB(jj);
            ref_w = [0,0,0];     % Frequency
            open('example_3_cascaded_attitude')
            sim('example_3_cascaded_attitude')

            xe = [qe.Data(:,2:4),omegae.Data];
            normxe = sqrt(sum(xe.^2,2));
            tt = linspace(0,Tsim,1000);
            bound = @(t) 2*normxe(1).*exp(-t * min([1/(2*tau_omega), 1/tau_q]));

            subplot(1,2,n);h(max(ii,jj)) = plot(qe.Time, log(normxe), 'k', 'Linewidth', 1, 'LineStyle',style{max(ii,jj)})
            subplot(1,2,n);hold on;plot(tt, log(bound(tt)), 'r', 'Linewidth', 1, 'LineStyle',style{max(ii,jj)})
            axis([0,Tsim,-10,5])
        end
    end
    if n == 1
        legend(h, {'$\tau_q=0.1$', '$\tau_q=0.5$', '$\tau_q=1$' '$\tau_q=1.5$'}, 'Interpreter','latex')
    else
        legend(h, {'$\tau_\omega=0.1$', '$\tau_\omega=0.5$', '$\tau_\omega=1$' '$\tau_\omega=1.5$'}, 'Interpreter','latex')
    end
end
%%
for n = 1:2
    subplot(1,2,n);
    xlabel('Time ($s$)', 'Interpreter','latex')
    ylabel('$\|{\bf x}^e(t)\|_2$', 'Interpreter','latex')
end
subplot(1,2,1); title('$\tau_q = \{0.1,1,1.5,2\}$ and $\tau_\omega = 1$', 'Interpreter','latex')
subplot(1,2,2); title('$\tau_q = 1$ and $\tau_\omega = \{0.1,1,1.5,2\}$', 'Interpreter','latex')