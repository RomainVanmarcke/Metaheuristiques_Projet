function matingPool = selection(selectionFunction, scoresg, M, L, popg, k)
    matingPool = zeros(M,L);
    indices = selectionFunction(scoresg, M, k);
    for i=1:M
          matingPool(i, :) = popg(indices(i), :);
    end
end
