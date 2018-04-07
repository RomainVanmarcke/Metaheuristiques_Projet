function result = fonseca(x)
    L = size(x,2);
    assert(L == 3);
    A = 0;
    B = 0;
    for i=1:L
        A = A + (x(i) - 1/sqrt(3))^2;
        B = B + (x(i) + 1/sqrt(3))^2;
    end
    result = [1 - exp(-A), 1 - exp(-B)];
end

