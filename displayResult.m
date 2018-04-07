function displayResult(problem, scoresFirstFrontSPEA2, scoresFirstFrontNSGA2, optiPareto, metricsSPEA2, metricsNSGA2) 
    % Display all chromosomes of the first front for the last generation
    figure;
    subplot(2,2,[1,2])
    plot(scoresFirstFrontNSGA2(:,1),scoresFirstFrontNSGA2(:,2),'bo');
    hold on;
    plot(scoresFirstFrontSPEA2(:,1),scoresFirstFrontSPEA2(:,2),'r*');
    hold off;
    
    title(['Pareto Front for ', func2str(problem.fitnessFunction), ' problem']);
    xlabel('f_1');
    ylabel('f_2');
    

    if length(problem.pareto) > 1
        hold on;
        line(optiPareto(:,1),optiPareto(:,2));
        hold off;
        legend('NSGA-II Pareto Front', 'SPEA-II Pareto Front', 'Optimal Pareto Front');
        


        subplot(2,2,3)
        X = 1:length(metricsNSGA2.first);
        plot(X,log10(metricsNSGA2.first(X)));
        hold on;
        
        X = 1:length(metricsSPEA2.first);
        plot(X,log10(metricsSPEA2.first(X)));
        hold off;
        xlabel('Generation Number');
        ylabel('Average Distance (log10)');
        legend('NSGA-II Average Distance', 'SPEA-II Average Distance');
        title(['Distance metric for ', func2str(problem.fitnessFunction)]);
        
        subplot(2,2,4)
        X = 1:length(metricsNSGA2.second);
        plot(X,(metricsNSGA2.second(X)));
        hold on;
        
        X = 1:length(metricsSPEA2.second);
        plot(X,(metricsSPEA2.second(X)));
        hold off;
        
        xlabel('Generation Number');
        ylabel('Delta');
        legend('NSGA-II Diversity metric', 'SPEA-II Diversity metric');
        title(['Diversity metric for ', func2str(problem.fitnessFunction)]);
    end
end