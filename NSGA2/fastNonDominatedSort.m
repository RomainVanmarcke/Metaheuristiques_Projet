function [fronts, ranks] = fastNonDominatedSort(scoresg)
    [N, objNumber] = size(scoresg);
    fronts(1).array = [];
    ranks = zeros(N,1);
    ind = [];
    for p=1:N
        ind(p).S = []; % A set of solutions that the solution p dominates
        ind(p).N = 0; % Number of solutions which dominates the solution p
        for q=1:N
            dom_less = 0;
            dom_equal = 0;
            dom_more = 0;
            for k=1:objNumber
                if (scoresg(p,k) < scoresg(q,k))
                    dom_less = dom_less + 1;
                elseif (scoresg(p,k) == scoresg(q,k))
                    dom_equal = dom_equal + 1;
                else
                    dom_more = dom_more + 1;
                end
            end
            if (dom_less == 0) && (dom_equal ~= objNumber)
                ind(p).N = ind(p).N + 1;
            elseif (dom_more == 0) && (dom_equal ~= objNumber)
                ind(p).S = [ind(p).S q];
            end
        end
        
        if ind(p).N == 0
            ranks(p) = 1;
            fronts(1).array = [fronts(1).array; p]; 
        end
    end
    f = 1;
    while ~isempty(fronts(f).array)
        Q = [];
        for m=1:length(fronts(f).array)
            p = fronts(f).array(m);
            Sp = ind(p).S;
            if ~isempty(Sp)
                for n=1:length(Sp)
                    q = Sp(n);
                    ind(q).N = ind(q).N - 1;
                    Nq = ind(q).N;
                    if Nq == 0
                        ranks(q) = f + 1;
                        Q = [Q; q];
                    end
                end
            end
        end
        f = f + 1;
        fronts(f).array = Q;
    end

end