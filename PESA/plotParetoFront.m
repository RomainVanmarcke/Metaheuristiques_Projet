function plotParetoFront(paretoFront, problemFunction)
    values = problemFunction(paretoFront);
    plot(values(:,1), values(:,2),'x');
    xlabel('1^{st} Objective');
    ylabel('2^{nd} Objective');
    grid on;
end