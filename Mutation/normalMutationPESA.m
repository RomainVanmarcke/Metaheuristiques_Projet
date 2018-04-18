function children = normalMutationPESA(children, pm, lowerBounds, upperBounds, n)
    sigma = 1;
    r = rand(size(children));
    normal = normrnd(0,1,size(children));
    children(r<pm) = children(r<pm) + normal(r<pm)*sigma;
end