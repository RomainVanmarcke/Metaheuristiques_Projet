function sortedLastFront = sortPartialOrder(indexes, distances)
    N = length(indexes);
    sortedLastFront = zeros(N,2);
    for i=1:N
        sortedLastFront(i,1) = indexes(i);
        sortedLastFront(i,2) = distances(i);
    end
    sortedLastFront = sortrows(sortedLastFront, 2, {'descend'});
    sortedLastFront = reshape(sortedLastFront(:,1),[N, 1]);
end

