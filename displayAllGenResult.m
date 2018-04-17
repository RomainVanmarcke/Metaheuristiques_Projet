function displayAllGenResult(problem, scoresMOFA, scoresNSGA2, optiPareto) 
    % Display all chromosomes of the first front for the last generation
    figure;
    title(['Pareto Front for ', func2str(problem.fitnessFunction), ' problem']);
    xlabel('f_1');
    ylabel('f_2');
    

    if length(problem.pareto) > 1
        hold on;
        line(optiPareto(:,1),optiPareto(:,2));
        hold off;
    end
    hold on;
    % MOFA
    xMOFA = scoresMOFA(1,:,1);
    yMOFA = scoresMOFA(1,:,2);
    mofa = plot(xMOFA, yMOFA,'r*');
    
    % NSGA2
    xNSGA2 = scoresNSGA2(1).array(:,1);
    yNSGA2 = scoresNSGA2(1).array(:,2);   
    nsga2 = plot(xNSGA2, yNSGA2,'bo');
    legend('Optimal Pareto Front', 'MOFA Pareto Front', 'NSGA2 Pareto Front');
    pause(3);
    
    for g=2:problem.Gmax
        title(['Pareto Front for  ', func2str(problem.fitnessFunction), ' problem Gen : ', num2str(g)]);
        % MOFA
        xMOFA = scoresMOFA(g,:,1);
        yMOFA = scoresMOFA(g,:,2);
        set(mofa,'XData',xMOFA,'YData',yMOFA);
        
        % NSGA2
        xNSGA2 = scoresNSGA2(g).array(:,1);
        yNSGA2 = scoresNSGA2(g).array(:,2);
        set(nsga2,'XData',xNSGA2,'YData',yNSGA2);
        pause(0.1);
    end
end