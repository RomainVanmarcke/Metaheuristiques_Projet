function children = mutation(mutationFunction, children, pm, lower, upper, b, g, Gmax, n, sigma)
	for i=1:size(children,1)
	    children(i,:) = mutationFunction(children(i,:), pm, lower, upper, b, g, Gmax, n, sigma);
	end
end