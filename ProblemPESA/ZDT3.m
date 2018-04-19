function values = ZDT3(x)
    subx = x(:,2:size(x,2));
    g = 1+9*sum(subx,2)/(size(subx,2));
    v1 = x(:,1);
    v2 = g.*(1-sqrt(v1./g)-v1./g.*sin(10*pi*v1));
    values = [v1, v2];
    values = real(values);
end