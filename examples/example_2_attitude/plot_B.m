function plot_B(qe, omegac, ii, tau, Tsim)
    % ~~~~~~~~~ Copyright (c) 2018 Marcus Greiff (see LICENCE.md) ~~~~~~~~~
    %
    % Plots for the second attitude rate example

    styles = {'-','--',':'};
    
    imqe0 = qe.Data(1,2:4);
    imqe  = qe.Data(:,2:4);
    
    
    metric = sqrt(sum(imqe.^2, 2));
    time = qe.time;

    t = linspace(0,Tsim,1000);

    subplot(1,3,1); hold on;
    bound = @(t) 2.*norm(imqe0)*exp(-t./tau(ii));
    plot(time, log(metric), ['k',styles{ii}], 'Linewidth',2)
    plot(t, log(bound(t)), ['r',styles{ii}], 'Linewidth',1)

    xlabel('Time [$s$]', 'Interpreter', 'latex')
    ylabel('$log\|\Im\{\mathbf{q}^{-1}\otimes \mathbf{q}^r\}\|_2|_{\tau}$', 'Interpreter', 'latex')

    subplot(1,3,2); hold on;
    plot(time, metric, ['k',styles{ii}], 'Linewidth',2)
    plot(t, bound(t), ['r',styles{ii}], 'Linewidth',1)

    xlabel('Time [$s$]', 'Interpreter', 'latex')
    ylabel('$\|\Im\{\mathbf{q}^{-1}\otimes \mathbf{q}^r\}\|_2|_{\tau}$', 'Interpreter', 'latex')

    subplot(1,3,3); hold on;
    metric = sqrt(sum(omegac.Data.^2, 2));
    time = omegac.time;
    plot(time, metric, ['k',styles{ii}], 'Linewidth',2)
    plot(t, 0.*t+2/tau(ii), ['r',styles{ii}], 'Linewidth',1)

    xlabel('Time [$s$]', 'Interpreter', 'latex')
    ylabel('$\|{\bf \omega}^c(t) - {\bf \omega}(t)\|_2|_{\tau}$', 'Interpreter', 'latex')
    
    
    if ii == 3
        legend({
            ['$\tau=',num2str(tau(1)),'$ (metric)'],...
            ['$\tau=',num2str(tau(1)),'$ (bound)'],...
            ['$\tau=',num2str(tau(2)),'$ (metric)'],...
            ['$\tau=',num2str(tau(2)),'$ (bound)'],...
            ['$\tau=',num2str(tau(3)),'$ (metric)'],...
            ['$\tau=',num2str(tau(3)),'$ (bound)'],...
        }, 'Interpreter', 'latex')
    end
    
end

