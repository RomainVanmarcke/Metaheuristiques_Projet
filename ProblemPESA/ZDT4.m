% function values = ZDT4(x)
%     subx = x(:,2:size(x,2));
%     g = 1+10*size(subx,2)+9*sum(subx.^2-10*cos(4*pi.*subx),2);
%     v1 = x(:,1);
%     v2 = g.*(1-sqrt(v1./g));
%     values = [v1, v2];
%     values = real(values);
% end

function values = ZDT4(x)
    g= zeros(size(x,1),1);
    for i = 1:size(x,1)
        for j=2:size(x,2)
            g(i)=g(i)+x(i,j)^2-10*cos(4*pi*x(i,j));
        end
        g(i)=g(i)+1+10*(size(x,2)-1);
    end
    
    v1 = x(:,1);
    v2 = g.*(1-sqrt(v1./g));
    values = [v1, v2];
end