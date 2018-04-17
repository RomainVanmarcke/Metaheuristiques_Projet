function displayResult(problem, scoresMOFA, scoresNSGA2, optiPareto, metrics) 
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
    
    hold on;
    plot(scoresMOFA(:,1),scoresMOFA(:,2),'r*');
    hold off;
    
    hold on;
    plot(scoresNSGA2(:,1),scoresNSGA2(:,2),'bo');
    hold off;
    legend('Optimal Pareto Front', 'MOFA Pareto Front', 'NSGA2 Pareto Front');

    subplot(2,2,3)
    X = 1:length(metrics.NSGA2.first);
    plot(X,log10(metrics.NSGA2.first(X)));
    hold on;

    X = 1:length(metrics.MOFA.first);
    plot(X,log10(metrics.MOFA.first(X)));
    hold off;
    xlabel('Generation Number');
    ylabel('Average Distance (log10)');
    legend('NSGA-II Average Distance', 'MOFA Average Distance');
    title(['Distance metric for ', func2str(problem.fitnessFunction)]);

    subplot(2,2,4)
    X = 1:length(metrics.NSGA2.second);
    plot(X,(metrics.NSGA2.second(X)));
    hold on;

    X = 1:length(metrics.MOFA.second);
    plot(X,(metrics.MOFA.second(X)));
    hold off;

    xlabel('Generation Number');
    ylabel('Delta');
    legend('NSGA-II Diversity metric', 'MOFA Diversity metric');
    title(['Diversity metric for ', func2str(problem.fitnessFunction)]);

end