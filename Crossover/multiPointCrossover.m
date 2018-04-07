function children = multiPointCrossover(firstParent, secondParent, ~)
    L = length(firstParent);
    firstChild = firstParent;
    secondChild = secondParent;
    
    % Select randomly two points
    firstPoint = randi([1, L-1]);
    secondPoint = randi([1, L-1]);
    
    % Select a new secondPoint in case they were identical
    while(secondPoint == firstPoint)
        secondPoint = randi([1, L-1]);
    end
    
    % firstPoint should be smaller than secondPoint
    if (firstPoint > secondPoint)
        tempPoint = firstPoint;
        firstPoint = secondPoint;
        secondPoint = tempPoint;
    end
    
    % Crossover
    firstChild(firstPoint:secondPoint) = secondParent(firstPoint:secondPoint);
    secondChild(firstPoint:secondPoint) = firstParent(firstPoint:secondPoint);
    
    children = [firstChild ; secondChild];
end