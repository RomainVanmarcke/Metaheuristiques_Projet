function scores = evaluation(problem, popg)
    N = size(popg,1);
    L = problem.L;
    scores = zeros(N, problem.objNumber); 
    
    for i=1:N
        for k=1:L
            x = popg(i,k);     
            assert((x >= problem.lower(k)) && (x <= problem.upper(k)), 'A chromosome has a X that does not respect its boundary : %4.2f', x);
        end
        x = popg(i,:);
        scores(i,1:problem.objNumber) = problem.fitnessFunction(x); 
    end
    
end