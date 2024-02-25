function HM = CalculateCrowdingDistance(gmhs,HM,front)
% Description: Calculate the 'crowding distance' used in the original NSGA-II.
nObj=length(HM(1).solutionsObjectiveValues);
idColumnInd = nObj+1;  % Column number of individual's id

for frontID = 1:length(front)
    
    indxOfIndsInCF = front{frontID};                                       % Indices of individuals in current front
    numOfIndsInCF = length(indxOfIndsInCF);                               % Number of individuals in current front
    c=1;
    indxOfIndsInCF
    objsValsOfIndsInCF=[];
    for i=indxOfIndsInCF
    objsValsOfIndsInCF(c,:) = HM(i).solutionsObjectiveValues;  % Individuals' objectives values in current front
                  c=c+1;                                              % Objctive values are sorted with individual ID
    end
    objsValsOfIndsInCF=[objsValsOfIndsInCF indxOfIndsInCF'];
    
    for m = 1:nObj
        
        objsValsOfIndsInCF = sortrows(objsValsOfIndsInCF,m);
        idColumnInd
        objsValsOfIndsInCF
        HM(objsValsOfIndsInCF(1,idColumnInd)).solutionDistance = Inf;             % The first one
        HM(objsValsOfIndsInCF(numOfIndsInCF,idColumnInd)).solutionDistance = Inf; % The last one
        
        minObj = objsValsOfIndsInCF(1,m);             % The maximum of objective m
        maxObj = objsValsOfIndsInCF(numOfIndsInCF,m); % The minimum of objective m
        
        for i = 2:numOfIndsInCF-1
            id = objsValsOfIndsInCF(i,idColumnInd);
            if maxObj==minObj
                del=0.001;
            else
                del=0;
            end
            HM(id).solutionDistance = HM(id).solutionDistance+(objsValsOfIndsInCF(i+1,m)-objsValsOfIndsInCF(i-1,m))/(maxObj-minObj+del);
        end
    end
end

end