function gmhs = Archive_SelectionOperator(gmhs)
% Description: Selection operator, use binary tournament selection.
ArSize=numel(gmhs.A);
j = 1;
while ArSize>gmhs.N
k=ArSize-gmhs.N
selIndices = zeros(1,k); % The indices of selected individuals
randNum = randi(ArSize,[1,ArSize]);


% for i = 1:2:(ArSize)
    
    individualInd1 = randNum(j);
    individualInd2 = randNum(j+1);
    
    % Crowded-comparison operator (NSGA-II)
    result = CrowdingComp(gmhs,individualInd1,individualInd2);
    
    if result==1
        selIndices = individualInd1;
    else
        selIndices = individualInd2;
    end
    
    gmhs.A(selIndices)=[];
    ArSize=numel(gmhs.A);
    j=j+1
end
% for i=1:HMS
% newHarmonyMemory(i,:) = gmhs.HM(selIndices(i)).sols;
% end
% % gmhs.HM=[];
% for i=1:gmhs.HMS
% gmhs.HM(i).sols = newHarmonyMemory(i,:);
% end
% gmhs.HM(gmhs.HMS+1:end)=[];
end

function result = CrowdingComp(gmhs,ind1,ind2)
% Description: Crowding comparison operator.
% Return:
%   1 = individual with index ind1 is better than individual with index ind2
%   0 = other cases

if (gmhs.A(ind1).solutionsRank>gmhs.A(ind2).solutionsRank) || ...
        (gmhs.A(ind1).solutionsRank==gmhs.A(ind2).solutionsRank) && ...
        (gmhs.A(ind1).solutionDistance<gmhs.A(ind2).solutionDistance)
    result = 1;
else
    result = 0;
end

end