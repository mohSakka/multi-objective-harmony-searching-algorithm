function dominationMatrix = CalculateDominationMatrix(gmhs,HM)
% This function calculate the domination matrix which specifies 
% the domination releation between two individuals
%
% ind1: index of individual 1
% ind2: index of individual 2
%
% dominationMatrix(ind1,ind2) = 1  : individual 1 dominates individual 2
% dominationMatrix(ind1,ind2) = -1 : individual 2 dominates individual 1
% dominationMatrix(ind1,ind2) = 0  : non dominate

dominationMatrix  = zeros(numel(HM));

for ind1 = 1:numel(HM)-1
    for ind2 = ind1+1:numel(HM)
        
        individual1ObjsValues = HM(ind1).solutionsObjectiveValues;
        individual2ObjsValues = HM(ind2).solutionsObjectiveValues;
        
        if IsDominant(gmhs,individual1ObjsValues,individual2ObjsValues)
            dominationMatrix(ind1,ind2) = 1;
        elseif IsDominant(gmhs,individual2ObjsValues,individual1ObjsValues)
            dominationMatrix(ind1,ind2) = -1;
        end
    end
end

dominationMatrix = dominationMatrix-dominationMatrix';

end