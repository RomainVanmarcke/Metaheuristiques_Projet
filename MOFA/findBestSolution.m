function min_index = findBestSolution( wk, scoresg )
%FINDBESTSOLUTION Summary of this function goes here
%   Detailed explanation goes here
    [N, objNumber] = size(scoresg);
    weight_scores_sum = zeros(N, 1);
    for i=1:N
        for k=1:objNumber
            weight_scores_sum(i) = weight_scores_sum(i) + wk(k)*scoresg(i,k);
        end
    end
    [min_value, min_index] = min(weight_scores_sum);
end

