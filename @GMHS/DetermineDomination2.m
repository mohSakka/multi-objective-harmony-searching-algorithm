%
% Copyright (c) 2015, Yarpiz (www.yarpiz.com)
% All rights reserved. Please read the "license.txt" for license terms.
%
% Project Code: YPEA121
% Project Title: Multi-Objective Particle Swarm Optimization (MOPSO)
% Publisher: Yarpiz (www.yarpiz.com)
% 
% Developer: S. Mostapha Kalami Heris (Member of Yarpiz Team)
% 
% Contact Info: sm.kalami@gmail.com, info@yarpiz.com
%

function gmhs=DetermineDomination2(gmhs)

    nPop=numel(gmhs.A);
    
    for i=1:nPop
        gmhs.A(i).IsDominated=false;
    end
    
    for i=1:nPop-1
        for j=i+1:nPop
            
            if Dominates(gmhs.A(i).solutionsObjectiveValues,gmhs.A(j).solutionsObjectiveValues)
               gmhs.A(j).IsDominated=true;
            end
            
            if Dominates(gmhs.A(j).solutionsObjectiveValues,gmhs.A(i).solutionsObjectiveValues)
               gmhs.A(i).IsDominated=true;
            end
            
        end
    end

end