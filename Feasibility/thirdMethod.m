function [x, counter] = thirdMethod(counter, x, lower, upper )
%THIRDMETHOD Generate new random gene within the bounds
%   Detailed explanation goes here
    if (x<lower || x>upper)
        x = lower + (upper - lower)*rand;
        counter = counter +1;
    end
end

