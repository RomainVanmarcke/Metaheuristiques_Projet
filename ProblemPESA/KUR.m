function values = KUR(x)
    v1 = zeros(size(x,1),1);
    for i = 1:2
        v1 = v1 - 10*exp(-0.2*sqrt(x(:,i).^2 + x(:,i+1).^2));
    end
    v2 = sum(abs(x).^0.8 + 5*sin((x).^3),2);
    values = [v1,v2];
end
    