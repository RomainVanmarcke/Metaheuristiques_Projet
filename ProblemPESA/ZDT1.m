function values = ZDT1(x)
    subx = x(:,2:size(x,2));
    g = 1+9*sum(subx,2)/size(subx,2);
    v1 = x(:,1);
    v2 = g.*(1-sqrt(v1./g));
    values = [v1, v2];
% 
%     [N,L] = size(x);
%     g = zeros(N,1);
%     v1 = zeros(N,1);
%     v2 = zeros(N,1);
%     for i = 1:N
%         g(i) = 1+9*sum(x(i,2:L))/(L-1);
%     end
%     for (
%     values = [x(:,1), g.*(1-sqrt(x(:,1)./g))];
    
end


%     disp(x)
%     disp(subx)
%     disp(g)
%     disp(v1)
%     disp(v2)