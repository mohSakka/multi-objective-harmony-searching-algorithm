function HM = FastNonDominatedSort(gmhs,HM)

% Initialization
for i=1:numel(HM)
HM(i).solutionsRank = 0;
HM(i).solutionDistance = 0; 
end
% Calculate the domination matrix
dominationMatrix = CalculateDominationMatrix(gmhs,HM);

% Find the domination information between the individuals
dominationInfo = FindDominationInfo(gmhs,HM,dominationMatrix);

% Calculate pareto rank of each individuals
[front,HM] = FindRankedParetoFronts(gmhs,HM,dominationInfo);

% Calculate the distance
HM = CalculateCrowdingDistance(gmhs,HM,front);

end