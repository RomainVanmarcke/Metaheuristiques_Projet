function [x, counter] = firstMethod(counter, x, lower, upper)
if x<lower
    x=lower;
	counter = counter +1;
end
if x>upper
    x=upper;
	counter = counter +1;
end
end