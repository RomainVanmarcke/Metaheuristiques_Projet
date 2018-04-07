function popg = testFeasibility(feasibilityFunction, popg, lower, upper, ~)
    % This function assures that no chromosome has a composant that does not respect the requirement
    % after a variation operation
    N = size(popg, 1);
    L = size(popg, 2);
    for i=1:N
        for k=1:L
            x = popg(i,k);
            x = feasibilityFunction(x, lower(k), upper(k));
            popg(i,k) = x;
        end
    end
end