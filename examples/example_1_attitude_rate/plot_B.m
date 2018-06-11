function plot_B(omegae, ii, tau, Tsim)
    % ~~~~~~~~~~~ Copyright (c) 2018 Marcus Greiff (see LICENCE.md) ~~~~~~~~~~~
    %
    % Plots for the second attitude rate example
 
    styles = {'-','--',':'};
    
    we = omegae.Data;
    we0 = we(1,:);
    
    metric = sqrt(sum(we.^2, 2));
    time = omegae.time;

    t = linspace(0,Tsim,1000);

    subplot(1,2,1); hold on;
    bound = @(t) norm(we0)*exp(-t./tau(ii));
    plot(time, log(metric), ['k',styles{ii}], 'Linewidth',2)
    plot(t, log(bound(t)), ['r',styles{ii}], 'Linewidth',1)

    xlabel('Time [$s$]', 'Interpreter', 'latex')
    ylabel('$log(\|{\bf \omega}^c(t) - {\bf \omega}(t)\|_2)|_{\tau}$', 'Interpreter', 'latex')

    subplot(1,2,2); hold on;
    plot(time, metric, ['k',styles{ii}], 'Linewidth',2)
    plot(t, bound(t), ['r',styles{ii}], 'Linewidth',1)

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

