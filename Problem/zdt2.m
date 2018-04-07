function result = zdt2(x)
    L = length(x);
    assert(L == 30);
    g = 1 + 9*sum(x(2:L))/(L-1);

    result = [x(1), g * ( 1-(x(1)/g)^2)];
end

