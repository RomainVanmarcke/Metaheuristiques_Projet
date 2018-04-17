function distance = crowdingDistanceAssignement(scoresg, g)
    [N, objNumber] = size(scoresg);
    distance = zeros(N, 1);
    scoresgm = zeros(N, 2);
    for m=1:objNumber
        A = 1:N;
        scoresgm(:,1) = A(:);
        scoresgm(:,2) = scoresg(:,m);
        sortM = sortrows(scoresgm,2);
        distance(sortM(1,1)) = Inf;
        distance(sortM(N,1)) = Inf;
        fmaxM = sortM(N,2);
        fminM = sortM(1,2);
        for i=2:(N-1)
            if (fmaxM - fminM == 0)
                distance(sortM(i,1)) = Inf;
            else
                distance(sortM(i,1))= distance(sortM(i,1)) + (sortM(i+1,2) - sortM(i-1,2))/(fmaxM - fminM);
%                 if distance(sortM(i,1)) == 0
%                     disp(0);
%                 end
            end
        end
    end
%     a=all(distance);
%     disp(a);
%     disp(distance);
%     assert(a);

end

