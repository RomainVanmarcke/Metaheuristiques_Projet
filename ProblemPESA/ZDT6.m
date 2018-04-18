function values = ZDT6(x)
    subx = x(:,2:size(x,2));
    g = 1+9*(sum(subx,2)/(size(subx,2))).^0.25;
    v1 = 1-exp(-4*x(:,1)).*sin(6*pi*x(:,1)).^6;
    v2 = g.*(1-(v1./g).^2);
    values = [v1, v2];
end