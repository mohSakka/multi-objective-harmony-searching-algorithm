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

function gmhs=DetermineDomination(gmhs)

    nPop=numel(gmhs.HM);
    
    for i=1:nPop
        gmhs.HM(i).IsDominated=false;
    end
    
    for i=1:nPop-1
        for j=i+1:nPop
            
            if Dominates(gmhs.HM(i).solutionsObjectiveValues,gmhs.HM(j).solutionsObjectiveValues)
               gmhs.HM(j).IsDominated=true;
            end
            
            if Dominates(gmhs.HM(j).solutionsObjectiveValues,gmhs.HM(i).solutionsObjectiveValues)
               gmhs.HM(i).IsDominated=true;
            end
            
        end
    end

end