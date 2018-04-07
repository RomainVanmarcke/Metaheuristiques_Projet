function children = singlePointCrossover(firstParent, secondParent, ~)
    L = length(firstParent);
    firstChild = firstParent;
    secondChild = secondParent;
    
    singlePoint = randi([1, L-1]);
    
    firstChild((singlePoint+1):L) = secondParent((singlePoint+1):L);
    secondChild((singlePoint+1):L) = firstParent((singlePoint+1):L);
    
    children = [firstChild ; secondChild];
end