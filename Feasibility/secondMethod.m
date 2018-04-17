function [x, counter] = secondMethod(counter, x, lower, upper)
if x<lower
    x=2*lower - x;
    counter = counter +1;
end
if x>upper
    x=2*upper - x;
    counter = counter +1;
end
end