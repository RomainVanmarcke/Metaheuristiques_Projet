function [ scores, archive, archive_history ] = MOFA(problem)
    %GENERAL SETTINGS
    N = problem.N; %Population size 
    L = problem.L; %Chromosome size
    objNumber = problem.objNumber; %Number of objective functions
    Gmax = problem.Gmax; %Generation max

    % INITIALIZATION
    pop(1,:,:) = initialization(N, L, problem.lower, problem.upper); 
    scores = zeros(Gmax, N, objNumber);
    counter = 0;
    archive.number_firefly = 0;
    archive.non_dominated_firefly = [];
    archive.firefly_scores = [];
    archive_history(1).array = [];
    
    % Process all generations
    for g=1:Gmax 
        popg = reshape(pop(g,:, :), [N, L]);
        % EVALUATION
        scoresg = evaluation(problem, popg);

        scores(g,:,:) = scoresg;
        popg_ori = popg;
        scoresg_ori = scoresg;
        
        % ITERATE THROUGH ALL FIREFLIES
        for i=1:N     
           number_moves = 0;
           for j=1:N
               if (i ~= j && dominates(scoresg_ori(j,:), scoresg(i,:)))
                   number_moves = number_moves + 1;
                   popg(i,:) = move_firefly( popg(i,:), popg_ori(j,:), problem);
                   [popg(i,:), counter] = testFeasibility(problem.feasibilityFunction, counter, popg(i,:), problem.lower, problem.upper);
                   scoresg(i,:) = evaluation(problem, popg(i,:));
               end
              
           end
           % INSERT IN OR AFTER THE SECOND FOR LOOP
           if (number_moves < 1)
               % UPDATE ARCHIVE
               archive = update_archive(archive, popg(i,:), scoresg(i,:), problem.M);  
               
               wk = randfixedsum(objNumber,1,1,0,1);
               bestFirefly = popg(findBestSolution(wk, scoresg),:);
               % RANDOM WALK
               popg(i,:) = random_walk(bestFirefly, problem.alpha);
               [popg(i,:), counter] = testFeasibility(problem.feasibilityFunction, counter, popg(i,:), problem.lower, problem.upper);
               scoresg(i,:) = evaluation(problem, popg(i,:));
           end
           % UPDATE NEXT GENERATION
           pop(g+1,i,:) =  popg(i,:);
           
        end
        % Archive history
        archive_history(g).array = archive.firefly_scores;
        
        % Decrease value of alpha through time
        problem.alpha = problem.alpha.*problem.delta;
    end
    fprintf("MOFA : Number of x out of bound : %d\n", counter);
    
end
    

