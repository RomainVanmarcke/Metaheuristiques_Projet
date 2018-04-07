function result = kursawe( x )
    L = size(x,2);
    assert(L == 3);
    A = 0;
    B = 0;
    for i=1:(L-1)
        A = A - 10*exp(-0.2*sqrt(x(i)^2 + x(i+1)^2));
    end
    for i =1:L
        B = B + abs(x(i))^0.8 + 5*sin(x(i)^3);
    end
    result = [A, B];
end

