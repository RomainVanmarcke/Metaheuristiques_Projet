function displayResult(problem, scoresFirstFrontPESA, scoresFirstFrontNSGA2, optiPareto, metricsPESA, metricsNSGA2) 
    % Display all chromosomes of the first front for the last generation
    figure;
    subplot(2,2,[1,2])
    plot(scoresFirstFrontNSGA2(:,1),scoresFirstFrontNSGA2(:,2),'bo');
    hold on;
    plot(scoresFirstFrontPESA(:,1),scoresFirstFrontPESA(:,2),'r*');
    hold off;
    
    title(['Pareto Front for ', func2str(problem.fitnessFunction), ' problem']);
    xlabel('f_1');
    ylabel('f_2');

    if length(problem.pareto) > 1
        hold on;
        line(optiPareto(:,1),optiPareto(:,2));
        hold off;
        legend('NSGA-II Pareto Front', 'PESA Pareto Front', 'Optimal Pareto Front');
        


        subplot(2,2,3)
        X = 1:length(metricsNSGA2.first);
        plot(X,log10(metricsNSGA2.first(X)));
        hold on;
        
        X = 1:length(metricsPESA.first);
        plot(X,log10(metricsPESA.first(X)));
        hold off;
        xlabel('Generation Number');
        ylabel('Average Distance (log10)');
        legend('NSGA-II Average Distance', 'PESA Average Distance');
        title(['Distance metric for ', func2str(problem.fitnessFunction)]);
        
        subplot(2,2,4)
        X = 1:length(metricsNSGA2.second);
        plot(X,(metricsNSGA2.second(X)));
        hold on;
        
        X = 1:length(metricsPESA.second);
        plot(X,(metricsPESA.second(X)));
        hold off;
        
        xlabel('Generation Number');
        ylabel('Delta');
        legend('NSGA-II Diversity metric', 'PESA Diversity metric');
        title(['Diversity metric for ', func2str(problem.fitnessFunction)]);
    end
end