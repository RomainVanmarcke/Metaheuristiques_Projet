function children = normalMutationPESA(children, pm, lowerBounds, upperBounds, n)
    sigma = 1;
%     r = rand(size(children));
%     normal = normrnd(0,1,size(children));
%     children(r<pm) = children(r<pm) + normal(r<pm)*sigma;
    
    for j = 1:size(children,1)
        child = children(j,:);
        for i=1:length(child)
            if rand<pm
                child(i) = child(i)+normrnd(0,1)*sigma;
            end
        end
        children(j,:) = child;
    end
      
end