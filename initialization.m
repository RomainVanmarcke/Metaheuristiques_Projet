function pop = initialization(N, L, lower, upper)
    % Create the first generation
    pop = zeros(N, L);
    for n = 1:N
        for l = 1:L
            x = lower(l) + (upper(l) - lower(l))*rand;
            pop(n,l) = x;
        end
    end
end