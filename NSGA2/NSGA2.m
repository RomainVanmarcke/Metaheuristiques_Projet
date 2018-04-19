function [paretoFront, scores ] = NSGA2(problem)
    %% CONFIGURATION PART 

    
    %GENERAL SETTINGS
    N = problem.N; %Population size 
    L = problem.L; %Chromosome size
    objNumber = 2; %Number of objective functions
    Gmax = problem.Gmax; %Generation max
    pc = 0.9; %Crossover probability
    pm = 1/L; %Mutation probability
    M = N; %MatingPool size

    %SELECTION
    selectionFunction = @tournamentSelection; %need k
    k = 2; %size of tournament
    
    %CROSSOVER
    crossoverFunction = @uniformCrossover;
    alpha = 0.5; %control the scope of the expansion
    
    %MUTATION
    mutationFunction = @normalMutation; %need n
    b = 1; %control the speed of the annealing
    sigma = 1; %standard deviation vector
    n = 20; %control parameter
    
    %FEASIBILITY
    feasibilityFunction = @secondMethod;
    
    %% EXECUTION PART
%     scores = zeros(Gmax, N, objNumber); %scores is a matrix of scores
    % INITIALIZATION
    pool = initialization(N, L, problem.lower, problem.upper); 
    scores1 = evaluation(problem, pool);
    [~, ranks] = fastNonDominatedSort(scores1);
    matingPool= selection(selectionFunction, ranks, M, L, pool, k); %matingPool is a vector of chromosomes
    children = crossover(crossoverFunction, matingPool, pc, L, alpha); %children is a vector of chromosomes
    children = mutation(mutationFunction, children, pm, problem.lower, problem.upper, b, 1, Gmax, n, sigma);
    children = testFeasibility(feasibilityFunction, 0, children, problem.lower, problem.upper);
    
    pop = zeros(Gmax, 2*N, L);
    paretoFront(1).array = [];
    scores(1).array = [];
    % Process all generations
    for g=1:Gmax 
        pop(g,:,:) = [pool; children];
        popg = reshape(pop(g,:, :), [2*N, L]); 
        
        % EVALUATION
        scoresg = evaluation(problem, popg);
        [fronts, ranks] = fastNonDominatedSort(scoresg);
        
        poolIdx = [];
        f = 1;
        while (length(poolIdx) + length(fronts(f).array)) <= N
            poolIdx = [poolIdx; fronts(f).array];
            f = f + 1;
        end
        
        if (length(poolIdx) ~= N)
            scoresFrontf = [];
            for i=1:length(fronts(f).array)
                scoresFrontf = [scoresFrontf; scoresg(fronts(f).array(i),:)];
            end
            distances = crowdingDistanceAssignement(scoresFrontf, g);
            sortedLastFront = sortPartialOrder(fronts(f).array, distances);
            poolIdx = [poolIdx; sortedLastFront(1:(N - length(poolIdx)))];
        end
        
        pool = zeros(N,L);
        newRanks = zeros(N,1);
        for i=1:N
            pool(i,:) = popg(poolIdx(i),:);
            newRanks(i) = ranks(poolIdx(i));
        end
        % Variation Operators

        matingPool= selection(selectionFunction, newRanks, M, L, pool, k); %matingPool is a vector of chromosomes
        children = crossover(crossoverFunction, matingPool, pc, L, alpha); %children is a vector of chromosomes
        children = mutation(mutationFunction, children, pm, problem.lower, problem.upper, b, g, Gmax, n, sigma);
        children = testFeasibility(feasibilityFunction, 0, children, problem.lower, problem.upper);

        % Find pareto front and distance metric foreach gen
        firstFrontIdx = fronts(1).array;
        scoresFirstFront = zeros(length(firstFrontIdx),2);
        for i=1:length(firstFrontIdx)
            scoresFirstFront(i,:) = scoresg(firstFrontIdx(i),:);
        end
        paretoFront(g).array = scoresFirstFront;
        
        scoresPool = evaluation(problem, pool);
        scores(g).array = scoresPool(:,:);      
        
    end
    
end
    

