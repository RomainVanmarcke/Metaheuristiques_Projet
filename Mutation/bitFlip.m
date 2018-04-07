function child = bitFlip(child, pm, ~, ~, ~, ~, ~, ~, ~)
for i = 1:length(child)
    if rand<pm
        child(i) = mod(child(i)+1, 2);
    end
end
