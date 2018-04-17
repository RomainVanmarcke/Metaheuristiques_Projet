function bool = dominates(x,y)
    %returns true if x dominates y
    bool = all(x<=y) && any(x<y);
end
