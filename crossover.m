function children = crossover(crossoverFunction, matingPool, pc, L, alpha)
    M = size(matingPool,1);
    perm = randperm(M);
    children =  zeros(M,L);
    i = 1;
    for n = 1:(M/2)
        firstParent = matingPool(perm(i),:);
        secondParent = matingPool(perm(i+1),:);
        if (rand <= pc )
            childpeer = crossoverFunction(firstParent, secondParent, alpha);
            children(i,:) = childpeer(1,:);
            children(i+1,:) = childpeer(2,:);
        else
            children(i,:) = firstParent;
            children(i+1,:) = secondParent;
        end
    %     fprintf('Parents : (%4.2f,%4.2f) and (%4.2f,%4.2f) have children : (%4.2f,%4.2f) and (%4.2f,%4.2f)\n',firstParent(1), firstParent(2), secondParent(1), secondParent(2), children(i,1), children(i,2),children(i+1,1), children(i+1,2));
        i= i + 2;
    end

    % If M is an odd number, the last chromosome is added without crossover
    if (mod(M,2))
        children(M,:) = matingPool(perm(M),:);
    end   
end

