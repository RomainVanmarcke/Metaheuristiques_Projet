function new_firefly = move_firefly( firefly, brighter_firefly, problem)
%MOVE_FIREFLY Summary of this function goes here
%   Detailed explanation goes here
    L = size(firefly,2);
    firefly = reshape(firefly(1,:, :), [1, L]);
    brighter_firefly = reshape(brighter_firefly(1,:, :), [1, L]);

    r = pdist2(firefly, brighter_firefly);
    beta=problem.beta0*exp(-problem.gamma.*r.^2);
    epsilon = (rand(1,L) - 0.5);
%     epsilon = (rand - 0.5);
    new_firefly = firefly + beta.*(brighter_firefly - firefly) + problem.alpha.*epsilon;
end

