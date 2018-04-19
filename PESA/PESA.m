function [paretoFrontAllG, scores ] = PESA(problem)
    T = problem.Gmax; % Maximum number of generations
    t = 0;  % current generation
    Pi = problem.N; % internal Population size
    Pe = 100; % externalPopulation size
    L = problem.L;  % chromosome size = number of genes
    pc = 0.7;
    pm = 1/3;
    nGrid = problem.nGrid; % number of grids per dimension
    % alpha = 0.5;
    n=20;
    %sigma = 1;
    
    M = Pi; % mating pool size
    
    crossoverFunction= problem.crossover;
%     crossoverFunction = @uniformCrossoverPESA;
    
    mutationFunction = problem.mutation;
%     mutationFunction = @polynomialMutationPESA;
%     mutationFunction = @boundaryMutationPESA;
%     mutationFunction = @uniformMutationPESA;
%    mutationFunction = @normalMutationPESA;
    
%     feasabilityFunction = @firstFeasability;
    feasabilityFunction = @secondFeasability;
    
%     problemFunction = problem.alias;
        
    lowerBounds = problem.lower; % lower bounds of the variables
    upperBounds = problem.upper; % upper bounds of the variables
    
%     if length(lowerBounds) == 1
%         lowerBounds = [lowerBounds, lowerBounds];
%         upperBounds = [upperBounds, upperBounds];
%     end
        
    gap = (upperBounds - lowerBounds)/nGrid;

    if length(lowerBounds) ~= 1
        internalPopulation = unifrnd(lowerBounds(2),upperBounds(2),Pi,L);
    end
    internalPopulation(:,1) = unifrnd(lowerBounds(1),upperBounds(1),Pi,1);
    internalPopulationGrid = zeros(Pi,L);
    
    externalPopulation = [];
    externalPopulationGrid = [];

    scores(1).array = []; 
    paretoFrontAllG(1).array = [];
    while t<T+1
        for i = 1:Pi
            internalPopulationGrid(i,:) = floor(internalPopulation(i,:)./gap);
        end
        
        all = [internalPopulation
            externalPopulation];
%         problemValue = problemFunction(all);
        problemValue = evaluation(problem, all);
        if t > 0
            scores(t).array = problemValue(:,:);
        end
        nall = size(all,1);
        dominationMatrix = false(nall, nall);
           
        for i=1:nall
            for j=i+1:nall
                
                if dominatesPESA(problemValue(i,:),problemValue(j,:))
                    dominationMatrix(i,j) = true;
                    
                elseif dominatesPESA(problemValue(j,:),problemValue(i,:))
                    dominationMatrix(j,i)=true;
                    
                end
                
            end
       
        end
        
        dominatedArchiveMembers = false(size(externalPopulation,1),1);
                
        for j=(Pi+1):nall
            if sum(dominationMatrix(:,j) == true)>0
                dominatedArchiveMembers(j-Pi) = true;
            end
        end

        externalPopulation(dominatedArchiveMembers == true,:) = [];
        externalPopulationGrid(dominatedArchiveMembers == true,:) = [];
        
        for j = 1:Pi
            if sum(dominationMatrix(:,j)==false)==nall
                externalPopulation= [externalPopulation; internalPopulation(j,:)]; %: ?
                externalPopulationGrid= [externalPopulationGrid; internalPopulationGrid(j,:)]; %: ?
            end
        end
               
        numArchive = size(externalPopulation, 1);
        squeezeFactor = ones(numArchive,1);
        crowdMatrix = false(numArchive, numArchive);
        
        for i = 1:numArchive                        
            for j=i+1:numArchive
                if sum(externalPopulationGrid(j,:)==externalPopulationGrid(i,:)) == L
                    squeezeFactor(i) = squeezeFactor(i)+1;
                    squeezeFactor(j) = squeezeFactor(j)+1;
                    crowdMatrix(i,j) = true;
                    crowdMatrix(j,i) = true;
                end
            end
        end

        
        while Pe<numArchive
            [~, indice] = max(squeezeFactor);
            squeezeFactor(indice) = 0;
            externalPopulation(indice,:) = [];
            externalPopulationGrid(indice,:) = [];
            for i = 1:size(crowdMatrix,1)
                if crowdMatrix(indice,i) == true
                    squeezeFactor(i) = squeezeFactor(i)-1;
                    crowdMatrix(indice,i)=false;
                    crowdMatrix(i,indice)=false;
                end
            end
            numArchive = numArchive-1;
        end          
        
        %Crossover
        children = zeros(M,L);
        
        %fonctionnement du 1-pc? s'appplique apr�s: donc 0,1 ou 2 enfants a
        %chaque it�ration; O� comprendre comme une alternative au crossover
        %usuelle
        
        for i = 1:M
            if rand<=pc
            
                p1 = binaryTournamentSelection(externalPopulation,squeezeFactor);
                p2 = binaryTournamentSelection(externalPopulation,squeezeFactor);

                kids = crossoverPESA(p1,p2,pc, crossoverFunction, n);
                children(i,:) = kids(1,:); 
            else
                children(i,:) = binaryTournamentSelection(externalPopulation,squeezeFactor);
            end
        end
        
        
        %Mutation
        internalPopulation = mutationFunction(children,pm, lowerBounds, upperBounds, n);
                
        
        while(any(any(internalPopulation<lowerBounds)) || any(any(internalPopulation>upperBounds)))
            internalPopulation = feasabilityFunction(internalPopulation, lowerBounds, upperBounds);
        end

        if t > 0    
            paretoFrontAllG(t).array = evaluation(problem, externalPopulation);
        end 
        t=t+1;   

    end
    
            
    
end

        
       
            
            
            
            
            
            
