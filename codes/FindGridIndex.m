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

function GridIndex=FindGridIndex(harmony,Grid)

    nObj=size(harmony(1).solutionsObjectiveValues,2);
    
    nGrid=numel(Grid(1).LB);
    
    GridSubIndex=zeros(1,nObj);
    
    for j=1:nObj
        
GridSubIndex(j)=...
            find(harmony.solutionsObjectiveValues(j)<Grid(j).UB,1,'first');
        
    end

  GridIndex=GridSubIndex(1);
    for j=2:nObj
   GridIndex=GridIndex-1;
   GridIndex=nGrid*GridIndex;
   GridIndex=GridIndex+GridSubIndex(j);
    end
    
end