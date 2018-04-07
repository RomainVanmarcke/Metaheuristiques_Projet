function selected = tournamentSelection(scoresg, M, k)
    selected = zeros(M,1);
    for j=1:M
        best = 0;
        for i=1:k
            % Select a random chromosome to challenge the current best chromosome
            pos = randi(length(scoresg));
            if best <= scoresg(pos)
                best = scoresg(pos);
                indice = pos;
            end
        end
        selected(j) = indice;
    end
    
end
