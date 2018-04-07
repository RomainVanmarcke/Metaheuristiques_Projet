function children = shuffleCrossover(firstParent, secondParent, ~)
L = length(firstParent);
p = randperm(L);
firstParentShuffled = firstParent;
secondParentShuffled = secondParent;
singlePoint = randi([1, L-1]);
for i=(singlePoint+1):L
    firstParentShuffled(p(i)) = secondParent(p(i));
    secondParentShuffled(p(i)) = firstParent(p(i));
end
children = [firstParentShuffled; secondParentShuffled];
end
