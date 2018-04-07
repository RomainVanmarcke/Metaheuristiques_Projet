function child = normalMutation(child, pm, ~, ~, ~, ~, ~, ~, sigma)
for i=1:length(child)
    if rand<pm
        child(i) = child(i)+normrnd(0,1)*sigma;
    end
end
end