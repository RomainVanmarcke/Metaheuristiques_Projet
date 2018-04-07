function result = zdt6(x)
    L = length(x);
    assert(L == 10);
    g = 1 + 9 * (sum(x(2:L))/(L-1))^0.25;
    a = 1 - exp(-4*x(1)) * sin(6*pi*x(1))^6;
    
    result = [a, g * (1 - (a/g)^2)];
end
    