function child = polynomialMutation(child, pm, lower, upper, ~, ~, ~, n, ~)
	for i=1:length(child)
        if (rand<pm)
            u = rand;
            if u<0.5
                e = (2*u)^(1/(n+1))-1;
            else
                e = 1-(2*(1-u))^(1/(n+1));
            end
%             delta = min(upper(i)-child(i), child(i)-lower(i));
            delta = (upper(i)-lower(i));
            child(i) = child(i)+delta*e;
        end
	end
end
