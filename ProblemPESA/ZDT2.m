function values = ZDT2(x)
   subx = x(:,2:size(x,2));
    g = 1+9*sum(subx,2)/(size(subx,2));
%     g = zeros(size(x,1),1);
%     for i = 1:size(x,1)
%         a=0;
%         for j=2:size(x,2)
%             a=a+x(i,j);
%         end
%         g(i) = 1+9*a/(size(x,2)-1);
%     end
    v1 = x(:,1);
    v2 = g.*(1-(v1./g).^2);
    values = [v1, v2];
end
    