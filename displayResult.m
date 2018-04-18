function displayResult(problem, scoresMOFA, scoresNSGA2, scoresPESA, optiPareto, metrics) 
    % Display all chromosomes of the first front for the last generation
    figure;
    xlabel('f_1');
    ylabel('f_2');
    subplot(2,2,[1,2])
    
    title(['Pareto Front for ', func2str(problem.fitnessFunction), ' problem']);
    if length(problem.pareto) > 1
        hold on;
        line(optiPareto(:,1),optiPareto(:,2));
        hold off;
    end
    % MOFA
    hold on;
    plot(scoresMOFA(:,1),scoresMOFA(:,2),'r*');
    hold off;
    % NSGA2
    hold on;
    plot(scoresNSGA2(:,1),scoresNSGA2(:,2),'bo');
    hold off;
    % PESA
    hold on;
    plot(scoresPESA(:,1),scoresPESA(:,2),'g+');
    hold off;
    legend('Optimal Pareto Front', 'MOFA Pareto Front', 'NSGA2 Pareto Front', 'PESA Pareto Front');

    subplot(2,2,3)
    % MOFA
    X = 1:length(metrics.MOFA.first);
    plot(X,log10(metrics.MOFA.first(X)));
    hold on;
    % NSGA2
    X = 1:length(metrics.NSGA2.first);
    plot(X,log10(metrics.NSGA2.first(X)));
    hold on;
    % PESA
    X = 1:length(metrics.PESA.first);
    plot(X,log10(metrics.PESA.first(X)));
    hold off;
    
    xlabel('Generation Number');
    ylabel('Average Distance (log10)');
    legend('MOFA Average Distance', 'NSGA-II Average Distance',  'PESA Average Distance');
    title(['Distance metric for ', func2str(problem.fitnessFunction)]);

    subplot(2,2,4)
    % MOFA
    X = 1:length(metrics.MOFA.second);
    plot(X,(metrics.MOFA.second(X)));
    hold on;
    % NSGA2
    X = 1:length(metrics.NSGA2.second);
    plot(X,(metrics.NSGA2.second(X)));
    hold on;
    % PESA
    X = 1:length(metrics.PESA.second);
    plot(X,(metrics.PESA.second(X)));
    hold off;

    xlabel('Generation Number');
    ylabel('Delta');
    legend('MOFA Diversity metric', 'NSGA-II Diversity metric', 'PESA Diversity metric');
    title(['Diversity metric for ', func2str(problem.fitnessFunction)]);

end