function pop = initialization(N, L, binary, lower, upper)
    % Create the first generation
    pop = zeros(N, L);
    for n = 1:N
        for l = 1:L
            if (binary)
                x = randi([0 1]);
            else
                x = lower(l) + (upper(l) - lower(l))*rand;
            end
            pop(n,l) = x;
        end
    end
end