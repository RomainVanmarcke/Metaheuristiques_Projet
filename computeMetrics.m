function metrics = computeMetrics(metrics, scoresPareto, scoresPool, scoresFirstFront, g)
    %FIRST METRIC
    D = pdist2(scoresPool, scoresPareto);
    minDistances = min(D);
    metrics.first(g) = mean(minDistances);

    %SECOND METRIC
    scoresParetoSorted = sortrows(scoresPareto);
    scoresFirstFrontSorted = sortrows(scoresFirstFront);
    N = size(scoresFirstFrontSorted,1);
    if N == 1
        metrics.second(g) = NaN;
    else
        d = zeros(N-1,1);
        for i=1:(N-1)
            d(i) = pdist(scoresFirstFrontSorted(i:i+1,:));
        end
        meanDi = mean(d);
        df = pdist([scoresParetoSorted(1,:); scoresFirstFrontSorted(1,:)]);
        dl = pdist([scoresParetoSorted(length(scoresParetoSorted),:); scoresFirstFrontSorted(length(scoresFirstFrontSorted),:)]);
        metrics.second(g) = (df + dl + sum(abs(d - meanDi)))/(df + dl + (N-1)*meanDi);
    end
    
 
end

