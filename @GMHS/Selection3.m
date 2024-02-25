function gmhs= Selection2(gmhs,iter)

gmhs=DetermineDomination(gmhs);
rankArr=zeros(1,numel(gmhs.HM));
gmhs.HM=FastNonDominatedSort(gmhs,gmhs.HM);
M = numel(gmhs.HM);
n=0;
rank=1;

% while M>gmhs.HMS
% idx=fortune_wheel(rankArr);
% gmhs.HM(idx)=[];
% rankArr(idx)=[];
% M=numel(gmhs.HM);
% end
for i=1:numel(gmhs.HM)
    sols(i,:)=gmhs.HM(i).sols;
    objs(i,:)=gmhs.HM(i).solutionsObjectiveValues;
    isDominated(i)=gmhs.HM(i).IsDominated;
    solRank(i)=gmhs.HM(i).solutionsRank;
    Distance(i)=gmhs.HM(i).solutionDistance;
end
% nextPopulation=zeros(gmhs.HMS,gmhs.Dim);
 for i=1:numel(gmhs.HM)
        rankArr(i)=gmhs.HM(i).solutionsRank;
 end
%  dist=[];
%     for i=1:numel(gmhs.HM)
%         dist=[dist gmhs.HM(i).solutionDistance];
%     end
    indices = find(rankArr==rank);
    numOfHarmonies = length(indices);
    while n+numOfHarmonies<=gmhs.HMS
    nextPopulationSols(n+1:n+numOfHarmonies,:)= sols(indices,:);
    nextPopulationObjs(n+1:n+numOfHarmonies,:)= objs(indices,:);
    nextPopulationDom(n+1:n+numOfHarmonies)= isDominated(indices);
    nextPopulationRanks(n+1:n+numOfHarmonies)= solRank(indices);
    nextPopulationDists(n+1:n+numOfHarmonies)= Distance(indices);
    n = n+numOfHarmonies;
    rank = rank+1;
    indices = find(rankArr==rank);
    numOfHarmonies = length(indices);
    end
    if n<gmhs.HMS
        distance =Distance(indices)'; 
        distance = [distance indices']; 
        
        mode2='old';
        if mode2=='old'
            distance = flipud(sortrows(distance,1));            % Sort the individuals in descending order of crowding distance in the front
   distance = [distance indices']; 
   indices  = distance(1:gmhs.HMS-n,2);  % Select the (popsize-n) individuals with largest crowding distance
   idx=indices;
        else
     solDist=calculateSolutionDistance(gmhs,indices);
     solDist(solDist==inf)=max(solDist~=inf)+1;
     solDist=solDist/(max(solDist)-min(solDist));
     solDist=[solDist indices'];
     d=distance(:,1);
     d(d==inf)=max(d~=inf)+1;
     d=d/(max(d)-min(d));
     pdfObjDist = (0.2*d(:,1)+0.8*solDist(:,1))./1;
        idx=zeros(gmhs.HMS-n,1);
     for ii=1:gmhs.HMS-n 
         di= fortune_wheel(pdfObjDist);
         if di==-1
             di=randi(length(pdfObjDist));
         end
         idx(ii)=distance(di,2);
         distance(di,:)=[];
         solDist(di,:)=[];
         pdfObjDist(di)=[];
     end
     
     
        end
   
   nextPopulationSols(n+1:gmhs.HMS,:)= sols(idx,:);
    nextPopulationObjs(n+1:gmhs.HMS,:)= objs(idx,:);
    nextPopulationDom(n+1:gmhs.HMS)= isDominated(idx);
    nextPopulationRanks(n+1:gmhs.HMS)= solRank(idx);
    nextPopulationDists(n+1:gmhs.HMS)= Distance(idx);
    end
    for i=1:size(nextPopulationSols,1)
    gmhs.HM(i).sols=nextPopulationSols(i,:);
    gmhs.HM(i).solutionsObjectiveValues=nextPopulationObjs(i,:);
    gmhs.HM(i).IsDominated=nextPopulationDom(i);
    gmhs.HM(i).solutionsRank=nextPopulationRanks(i);
    gmhs.HM(i).solutionDistance=nextPopulationDists(i);
    end
    gmhs.HM(gmhs.HMS+1:end)=[];
end
    
    
%     d(d==inf)=max(d(d~=inf));
% k=M-gmhs.HMS;
%  idx= kLargest(rankArr(:),k);
% while M>gmhs.HMS
%     
% if rand>0%exp(-0.05*iter)
%    
%     idx= kLargest(rankArr(:),k);
% idx=fortune_wheel(rankArr)
% if rankArr(idx)==1
%     [~,idx]=min(dist)
% end
%     gmhs.HM(idx)=[];
%     rankArr(idx)=[];
%     dist(idx)=[];
% else
%     
% %     k=M-gmhs.HMS;
% %     idx=fortune_wheel(1./d)
% %     while idx==-1
% %         idx=randi(length(d));
% %     end
%     [~,idx] = mink(dist(:),k);
%     gmhs.HM(idx)=[];
%     d(idx)=[];
%      rankArr(idx)=[];
% end
% M = numel(gmhs.HM);
% end