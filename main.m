function main()
    N = 100; %Population size 
    Gmax = 250; %Generation max

    %PROBLEM
    problem = [];
    problem.fitnessFunction = @zdt4;
    problem = setProblemParameters(problem, N, Gmax);
    
    metricsSPEA2 = [];
    metricsSPEA2.first = zeros(Gmax,1);
    metricsSPEA2.second = zeros(Gmax,1);
    metricsNSGA2 = [];
    metricsNSGA2.first = zeros(Gmax,1);
    metricsNSGA2.second = zeros(Gmax,1);
    OptiPareto = [];

    [paretoFrontSPEA2, scoresSPEA2 ] = SPEA2(problem);
    [paretoFrontNSGA2, scoresNSGA2 ] = NSGA2(problem);
    
    if length(problem.pareto) > 1
        OptiPareto= evaluation(problem, problem.pareto, 0, 2);
        for g=1:Gmax
            metricsNSGA2 = computeMetrics(metricsNSGA2, OptiPareto, scoresNSGA2(g).array, paretoFrontNSGA2(g).array, g); 
            metricsSPEA2 = computeMetrics(metricsSPEA2, OptiPareto, scoresSPEA2(g).array, paretoFrontSPEA2(g).array, g);
        end
    end
    
    %% DISPLAY PART
    fprintf('Result for Gen %d, Popsize %d \n', Gmax,N);
    displayResult(problem, paretoFrontSPEA2(Gmax).array, paretoFrontNSGA2(Gmax).array, OptiPareto, metricsSPEA2, metricsNSGA2);
end

