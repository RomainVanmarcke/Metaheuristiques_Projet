function child = nonUniformMutation(child, pm, lower, upper, b, g, Gmax, ~, ~)
for i=1:length(child)
        if rand<pm
            if rand>=0.5
                child(i) = child(i) + delta(g, upper(i) - child(i), b, Gmax);
            else
                child(i) = child(i) - delta(g, child(i) - lower(i), b, Gmax);
            end
        end
end
end

function d = delta(g, y, b, Gmax)
    d = y*(1 - rand^((1 - g)/Gmax)^b);
end
