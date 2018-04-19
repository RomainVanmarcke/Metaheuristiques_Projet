function pop = firstFeasability(pop, lowerBounds, upperBounds)
        lower =lowerBounds.*ones(size(pop,1),1);
        upper = upperBounds.*ones(size(pop,1),1);
        pop(pop<lower) = lower(pop<lower);
        pop(pop>upper) = upper(pop>upper);
end
