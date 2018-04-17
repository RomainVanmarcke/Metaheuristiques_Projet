function new_firefly = random_walk( best_firefly, alpha )
%RANDOM_WALK Summary of this function goes here
%   Detailed explanation goes here
    L = size(best_firefly,2);
    epsilon = (rand(1,L) - 0.5);
%     epsilon = (rand - 0.5);
    new_firefly = best_firefly + alpha.*epsilon;

end

