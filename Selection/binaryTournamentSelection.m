function selectedIndividual = binaryTournamentSelection(archive, squeezeFactor)
    
%     disp(size(archive,1))leg
    if (size(archive,1)==1)
        selectedIndividual = archive(1,:);
    
    else
        
    r = randsample(size(archive,1),2);
    
    firstIndividual = r(1);
    secondIndividual = r(2);
    
    if squeezeFactor(firstIndividual)<squeezeFactor(secondIndividual)
        selectedIndividual = archive(firstIndividual,:);
    else
        selectedIndividual = archive(secondIndividual,:);
    end
    
    end
    
end
    