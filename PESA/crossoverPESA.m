function children = crossoverPESA(firstParent, secondParent, pc, crossoverFunction, n)
    r= rand;
    if r > pc
        children =[firstParent; secondParent];
    else
        children = crossoverFunction(firstParent,secondParent, n);
    end
end
    