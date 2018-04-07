function children = simulatedBinaryCrossover(firstParent, secondParent, ~)
m=length(firstParent);
firstChild = zeros(1, m);
secondChild = zeros(1,m);
n = 20;

for i=1:m
    u = rand;
    if u<=0.5
        beta = (2*u)^(1/(n+1));
    else
        beta=(2*(1-u))^-(1/(n+1));
    end
    firstChild(i) = 0.5*(firstParent(i)+secondParent(i))+0.5*beta*(firstParent(i)-secondParent(i));
    secondChild(i) = 0.5*(firstParent(i)+secondParent(i))+0.5*beta*(secondParent(i)-firstParent(i));
end
children = [firstChild; secondChild];
end