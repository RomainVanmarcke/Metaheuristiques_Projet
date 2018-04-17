function bool = dominates( score_firefly_I, score_firefly_J )
%DOMINATES Return true if firefly_I dominates firefly_J
%   Detailed explanation goes here
    if (all(score_firefly_I <= score_firefly_J) && any(score_firefly_I < score_firefly_J))
        bool = true;
    else
        bool = false;
    end
end
