function result = zdt4(x)
    L = length(x);
    assert(L == 10);
    g = 1 + 10*(L-1);
    for i = 2:10
        g = g + x(i)^2 - 10* cos(4*pi*x(i));
    end
    result = [x(1), g*(1-sqrt(x(1)/g))];
end
    