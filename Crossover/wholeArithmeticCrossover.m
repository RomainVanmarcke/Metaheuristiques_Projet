function children = wholeArithmeticCrossover(firstParent, secondParent, ~)
	% Parameters
	alpha = rand;
	beta = 1 - alpha;

	firstChild = alpha*firstParent + beta*secondParent;
	secondChild = alpha*secondParent + beta*firstParent;
	children = [firstChild ; secondChild];
end