function values = FON(x)
    v1 = 1-exp(-sum((x-1/sqrt(3)).^2,2));
    v2 = 1-exp(-sum((x+1/sqrt(3)).^2,2));
    values = [v1, v2];
end