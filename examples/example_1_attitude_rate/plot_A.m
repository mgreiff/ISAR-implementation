function plot_A(omega, omegac, torquec)
    % ~~~~~~~~~~~ Copyright (c) 2018 Marcus Greiff (see LICENCE.md) ~~~~~~~~~~~
    %
    % Plots for the forst attitude rate example
    
    subplot(2,2,1:2); hold on;
    plot(omegac.Time, omegac.Data(:,1), 'g', 'Linewidth', 1)
    plot(omegac.Time, omegac.Data(:,2), 'r', 'Linewidth', 1)
    plot(omegac.Time, omegac.Data(:,3), 'b', 'Linewidth', 1)

    plot(omega.Time, omega.Data(:,1), 'g--', 'Linewidth', 2)
    plot(omega.Time, omega.Data(:,2), 'r--', 'Linewidth', 2)
    plot(omega.Time, omega.Data(:,3), 'b--', 'Linewidth', 2)

    xlabel('Time [$s$]', 'Interpreter', 'latex')
    ylabel('Rate, ${\bf \omega}^c(t)$ and ${\bf \omega}(t)$, [$rad/s$]', 'Interpreter', 'latex')
    legend({'$\omega_x^c(t)$', '$\omega_y^c(t)$', '$\omega_z^c(t)$','$\omega_x(t)$', '$\omega_y(t)$', '$\omega_z(t)$'}, 'Interpreter', 'latex', 'Location', 'EastOutside')

    subplot(2,2,3:4); hold on;
    plot(torquec.Time, torquec.Data(:,1), 'g', 'Linewidth', 1)
    plot(torquec.Time, torquec.Data(:,2), 'r', 'Linewidth', 1)
    plot(torquec.Time, torquec.Data(:,3), 'b', 'Linewidth', 1)
    xlabel('Time [$s$]', 'Interpreter', 'latex')
    ylabel('Torque, ${\bf\tau}^c(t)$, [$N\cdot m$]', 'Interpreter', 'latex')
    legend({'$\tau_x^c$', '$\tau_y^c$', '$\tau_z^c$'}, 'Interpreter', 'latex', 'Location', 'EastOutside')
end