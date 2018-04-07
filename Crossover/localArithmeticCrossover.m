function children = localArithmeticCrossover(firstParent, secondParent, ~)
alpha = rand(1,length(firstParent));
firstChild = alpha.*firstParent + (1-alpha).*secondParent;
secondChild = alpha.*secondParent + (1-alpha).*firstParent;
children = [firstChild ; secondChild];
end
