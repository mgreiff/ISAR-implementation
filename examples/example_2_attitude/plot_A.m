function plot_A(q, qc, omegac, state, SO3metric)
    % ~~~~~~~~~ Copyright (c) 2018 Marcus Greiff (see LICENCE.md) ~~~~~~~~~
    %
    % Plots for the forst attitude rate example
    
    subplot(3,2,1:2); hold on;
    plot(q.Time, q.Data(:,1), 'k-', 'Linewidth', 2)
    plot(q.Time, q.Data(:,2), 'r-', 'Linewidth', 2)
    plot(q.Time, q.Data(:,3), 'b-', 'Linewidth', 2)
    plot(q.Time, q.Data(:,4), 'g-', 'Linewidth', 2)

    plot(qc.Time, qc.Data(:,1), 'k--', 'Linewidth', 1)
    plot(qc.Time, qc.Data(:,2), 'r--', 'Linewidth', 1)
    plot(qc.Time, qc.Data(:,3), 'b--', 'Linewidth', 1)
    plot(qc.Time, qc.Data(:,4), 'g--', 'Linewidth', 1)

    plot(qc.Time, -qc.Data(:,1), 'k:', 'Linewidth', 1)
    plot(qc.Time, -qc.Data(:,2), 'r:', 'Linewidth', 1)
    plot(qc.Time, -qc.Data(:,3), 'b:', 'Linewidth', 1)
    plot(qc.Time, -qc.Data(:,4), 'g:', 'Linewidth', 1)

    
    xlabel('Time [$s$]', 'Interpreter', 'latex')
    ylabel('Rate, ${\bf q}^c(t)$ and ${\bf q}(t)$, [$rad/s$]', 'Interpreter', 'latex')
    legend({'$q_w(t)$','$q_x(t)$', '$q_y(t)$','$q_z(t)$',...
            '$q_w^c(t)$','$q_x^c(t)$', '$q_y^c(t)$','$q_z^c(t)$',...
            }, 'Interpreter', 'latex', 'Location', 'EastOutside')

    subplot(3,2,3:4); hold on;
    plot(omegac.Time, omegac.Data(:,1), 'r', 'Linewidth', 1)
    plot(omegac.Time, omegac.Data(:,2), 'b', 'Linewidth', 1)
    plot(omegac.Time, omegac.Data(:,3), 'g', 'Linewidth', 1)
    xlabel('Time [$s$]', 'Interpreter', 'latex')
    ylabel('Controlled rate, ${\bf\omega}^c(t)$, [$rad/s$]', 'Interpreter', 'latex')
    legend({'$\omega_x^c$', '$\omega_y^c$', '$\omega_z^c$'}, 'Interpreter', 'latex', 'Location', 'EastOutside')
    
    subplot(3,2,5:6); hold on;
    plot(SO3metric.Time, SO3metric.Data/2, 'k', 'Linewidth', 2)
    xlabel('Time [$s$]', 'Interpreter', 'latex')
    ylabel('Error metric on $SO(3)$', 'Interpreter', 'latex')
    legend({'$\frac{1}{2}$tr$({\bf I}_{3\times 3} - {\bf R}^T {\bf R}^c$)'}, 'Interpreter', 'latex', 'Location', 'EastOutside')
    
    % Visualize the AW-switches as filled patches
    maxq = 1.1*max([max(max(q.Data)), max(max(qc.Data))]);
    minq = 1.1*min([min(min(q.Data)), min(min(qc.Data))]);
    maxw = 1.1*max(max(omegac.Data));
    minw = 1.1*min(min(omegac.Data));

    ts = 0;
    ss = state.Data(1);
    for ii = 1:length(state.Time)
        if ss ~= state.Data(ii)
            
            tf = state.Time(ii);
            if ss > 0
                subplot(3,2,1:2); hold on; axis([0, state.Time(end), minq, maxq])
                patch([ts, tf, tf, ts, ts],...
                      [maxq, maxq, minq, minq, maxq],...
                      'k', 'FaceAlpha', 0.2, 'EdgeColor', 'none')
                subplot(3,2,3:4); hold on; axis([0, state.Time(end), minw, maxw])
                patch([ts, tf, tf, ts, ts],...
                      [maxw, maxw, minw, minw, maxw],...
                      'k', 'FaceAlpha', 0.2, 'EdgeColor', 'none')
                subplot(3,2,5:6); hold on; axis([0, state.Time(end), 0, 4.1])
                patch([ts, tf, tf, ts, ts],...
                      [4.1, 4.1, 0, 0, 4.1],...
                      'k', 'FaceAlpha', 0.2, 'EdgeColor', 'none')
            end
            ss = state.Data(ii);
            ts = state.Time(ii);
        end
    end
end