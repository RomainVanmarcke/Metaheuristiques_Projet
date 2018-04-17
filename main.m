function main()
    N = 100; %Population size 
    Gmax = 250; %Generation max

    %PROBLEM
    problem = [];
    problem.fitnessFunction = @zdt1;
    problem = setProblemParameters(problem, N, Gmax);
    
    metricsPESA = [];
    metricsPESA.first = zeros(Gmax,1);
    metricsPESA.second = zeros(Gmax,1);
    metricsNSGA2 = [];
    metricsNSGA2.first = zeros(Gmax,1);
    metricsNSGA2.second = zeros(Gmax,1);
    OptiPareto = [];

    [paretoFrontPESA, scoresPESA ] = PESA(problem);
    [paretoFrontNSGA2, scoresNSGA2 ] = NSGA2(problem);
    
    if length(problem.pareto) > 1
        OptiPareto= evaluation(problem, problem.pareto, 0, 2);
        for g=1:Gmax
            metricsNSGA2 = computeMetrics(metricsNSGA2, OptiPareto, scoresNSGA2(g).array, paretoFrontNSGA2(g).array, g); 
            metricsPESA = computeMetrics(metricsPESA, OptiPareto, scoresPESA(g).array, paretoFrontPESA(g).array, g);
        end
    end
    
    %% DISPLAY PART
    fprintf('Result for Gen %d, Popsize %d \n', Gmax,N);
    displayResult(problem, paretoFrontPESA(Gmax).array, paretoFrontNSGA2(Gmax).array, OptiPareto, metricsPESA, metricsNSGA2);
end

