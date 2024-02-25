function gmhs = GMHS_SelectionOperator(gmhs)
% Description: Selection operator, use binary tournament selection.
HMS=gmhs.HMS;
selIndices = zeros(1,HMS); % The indices of selected individuals
randNum = randi(HMS,[1,2*HMS]);

j = 1;
for i = 1:2:(HMS*2)
    
    individualInd1 = randNum(i);
    individualInd2 = randNum(i+1);
    
    % Crowded-comparison operator (NSGA-II)
    result = CrowdingComp(gmhs,individualInd1,individualInd2);
    
    if result==1
        selIndices(j) = individualInd1;
    else
        selIndices(j) = individualInd2;
    end
    j = j+1;
end
for i=1:HMS
newHarmonyMemory(i,:) = gmhs.HM(selIndices(i)).sols;
end
% gmhs.HM=[];
for i=1:gmhs.HMS
gmhs.HM(i).sols = newHarmonyMemory(i,:);
end
end

function result = CrowdingComp(gmhs,ind1,ind2)
% Description: Crowding comparison operator.
% Return:
%   1 = individual with index ind1 is better than individual with index ind2
%   0 = other cases

if (gmhs.HM(ind1).solutionsRank<gmhs.HM(ind2).solutionsRank) || ...
        (gmhs.HM(ind1).solutionsRank==gmhs.HM(ind2).solutionsRank) && ...
        (gmhs.HM(ind1).solutionDistance>gmhs.HM(ind2).solutionDistance)
    result = 1;
else
    result = 0;
end

end