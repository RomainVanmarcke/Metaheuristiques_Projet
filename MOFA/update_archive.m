function archive = update_archive( archive, new_firefly, new_firefly_score, M)
%UPDATE_ARCHIVE update list of non dominated fireflies with new one
%   Detailed explanation goes here     
    N = archive.number_firefly;
    if (N == 0)
        archive.number_firefly = 1;
        archive.non_dominated_firefly = new_firefly;
        archive.firefly_scores = new_firefly_score;       
    else
        new_is_dominated = false;
        for i=1:N
            if (dominates(archive.firefly_scores(i,:), new_firefly_score)) % if one old firefly dominates new firefly stop there !
                new_is_dominated = true;
                break;
            end 
        end
        
        
        if (~new_is_dominated)
            archive.number_firefly = 0;
            old_archive_firefly =  archive.non_dominated_firefly;
            old_archive_scores =  archive.firefly_scores;
            archive.non_dominated_firefly = [];
            archive.firefly_scores = [];
            for i=1:N
                old_score = old_archive_scores(i,:);
                old_firefly = old_archive_firefly(i,:);
                if (~dominates(new_firefly_score, old_score))  % if old firefly is not dominated by new firefly keep it
                    archive.number_firefly = archive.number_firefly + 1;
                    archive.non_dominated_firefly = [archive.non_dominated_firefly; old_firefly];
                    archive.firefly_scores = [archive.firefly_scores; old_score];
                end 
            end
            
            % New firefly is non dominated, add it to archive
            if (archive.number_firefly < M)
                archive.number_firefly = archive.number_firefly + 1;
                archive.non_dominated_firefly = [archive.non_dominated_firefly; new_firefly];
                archive.firefly_scores = [archive.firefly_scores; new_firefly_score];
            end
        end

    end

end

