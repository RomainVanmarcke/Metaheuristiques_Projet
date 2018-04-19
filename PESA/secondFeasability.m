function pop = secondFeasability(pop, lowerBounds, upperBounds)
        pop1=pop(:,1);
        pop1(pop1<lowerBounds(1)) = 2*lowerBounds(1)-pop1(pop1<lowerBounds(1));
        pop1(pop1>upperBounds(1)) = 2*upperBounds(1)-pop1(pop1>upperBounds(1));

        
        if length(lowerBounds) ~=1
            popn=pop(:,2:end);
            popn(popn<lowerBounds(2)) = 2*lowerBounds(2)-popn(popn<lowerBounds(2));
            popn(popn>upperBounds(2)) = 2*upperBounds(2)-popn(popn>upperBounds(2));
            
            pop = [pop1 popn];  
        else
            pop = pop1;
        end
            

end
