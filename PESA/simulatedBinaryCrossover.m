function children = simulatedBinaryCrossover(firstParent,secondParent, n)
    u = rand(size(firstParent));
    beta = zeros(size(u));
    beta(u<=0.5) = (2*u(u<=0.5)).^(1/(n+1));
    beta(u>0.5) = (2*(1-u(u>0.5))).^-(1/(n+1));
    
    firstChild = 0.5*(firstParent+secondParent) + 0.5*beta.*(firstParent-secondParent);
    secondChild = 0.5*(firstParent+secondParent) + 0.5*beta.*(secondParent-firstParent);
    children = [firstChild; secondChild];
end