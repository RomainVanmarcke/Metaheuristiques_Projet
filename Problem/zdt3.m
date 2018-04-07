function result = zdt3(x)
    L = length(x);
    assert(L == 30);
    g = 1 + 9*sum(x(2:L))/(L-1);

    result = [x(1), g * ( 1-sqrt(x(1)/g) - x(1)/g*sin(10*pi*x(1)) )];
end
