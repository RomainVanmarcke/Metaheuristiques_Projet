function main()
    all = tic;
    N = 100; %Population size 
    Gmax = 250; %Generation max
    objNumber = 2; %Number of objectives functions
    M = 200; % Number of points wanted in MOFA approximation of Pareto Front

    %PROBLEM
    problem.fitnessFunction = @zdt1;
    problem = setProblemParameters(problem, N, Gmax, objNumber);
    
    % MOFA PARAMETERS
    Z = problem.upper - problem.lower;
    problem.alpha = 0.5.*Z; % Random coefficient 0-1
    problem.gamma = 0.5./(Z.^2); % Attraction coefficient, the bigger the less attractive (and faster !?)
    problem.beta0 = 1;
    problem.delta = 0.99;
    problem.M = M;
    problem.feasibilityFunction = @firstMethod;
    
    % PESA PARAMETERS
    problem.nGrid = 10; % number of grids per dimension
    problem.crossover = @simulatedBinaryCrossoverPESA;
    problem.mutation = @boundaryMutationPESA;
    
    tic
    [scoresMOFA, archiveMOFA, archive_history] = MOFA(problem);
    toc
    tic
    [paretoFrontNSGA2, scoresNSGA2 ] = NSGA2(problem);
    toc
    tic
    [paretoFrontPESA, scoresPESA] = PESA(problem);
    toc
    
    % COMPUTE METRICS
    metrics.MOFA.first = zeros(Gmax,1);
    metrics.MOFA.second = zeros(Gmax,1);
    metrics.NSGA2.first = zeros(Gmax,1);
    metrics.NSGA2.second = zeros(Gmax,1);
    metrics.PESA.first = zeros(Gmax,1);
    metrics.PESA.second = zeros(Gmax,1);
    if length(problem.pareto) > 1
        OptiPareto= evaluation(problem, problem.pareto);
        for g=1:Gmax
            metrics.NSGA2 = computeMetrics(metrics.NSGA2, OptiPareto, paretoFrontNSGA2(g).array, g); 
            metrics.PESA = computeMetrics(metrics.PESA, OptiPareto, paretoFrontPESA(g).array, g); 
            metrics.MOFA = computeMetrics(metrics.MOFA, OptiPareto, archive_history(g).array, g);
        end
    end
    toc(all);
    %% DISPLAY PART
    fprintf('Alpha(at start) : %4.2f, Alpha(at end) : %4.2f,  Gamma : %4.2f \n', problem.alpha(1), problem.alpha(1)*0.97^Gmax,problem.gamma(1));
    fprintf('Result for Gen %d, Popsize %d \n', Gmax,N);
    fprintf('Number of results in MOFA archive %d \n', archiveMOFA.number_firefly);
    displayAllGenResult(problem, scoresMOFA, paretoFrontNSGA2, paretoFrontPESA, OptiPareto);
    displayResult(problem, archiveMOFA.firefly_scores, paretoFrontNSGA2(Gmax).array, paretoFrontPESA(Gmax).array, OptiPareto, metrics);
end

