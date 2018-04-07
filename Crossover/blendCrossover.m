function children = blendCrossover(firstParent, secondParent, alpha)
    L = length(firstParent);
    firstChild = zeros(1, L);
    secondChild = zeros(1, L);
    
    for i = 1:L
        delta = abs(firstParent(i) - secondParent(i));
        % x1 must be the biggest of (x1,x2)
        % x2 the smallest 
        x1 = min(firstParent(i), secondParent(i));
        x2 = max(firstParent(i), secondParent(i));
        
        a= x1 - alpha*delta;
        b= x2 + alpha*delta;
        firstChild(i) = a+ (b-a)*rand;
        secondChild(i) = a+ (b-a)*rand;
    end
    
    children = [firstChild ; secondChild];
end