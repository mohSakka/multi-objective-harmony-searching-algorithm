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
nGrid=7;alpha=0.1;
Grid=CreateGrid(gmhs.HM,nGrid,alpha);
for i=1:numel(gmhs.HM)
    gmhs.HM(i).GridIndex=FindGridIndex(gmhs.HM(i),Grid);
end
gi=zeros(1,numel( gmhs.HM));
for i=1:numel(gmhs.HM)
    gi(i)=gmhs.HM(i).GridIndex;
end
uniq=(unique(gi));
fitness= 10*ones(1,numel(gmhs.HM));
counter=zeros(1,length(uniq));
for j=1:length(uniq)
    
    for i=1:numel(gmhs.HM)
        if gmhs.HM(i).GridIndex==uniq(j)
            counter(j)=counter(j)+1;
        end
    end
end

for j=1:length(uniq)
    for i=1:numel(gmhs.HM)
        if gmhs.HM(i).GridIndex==uniq(j)
            fitness(i)=10/counter(j);
        end
    end
end
P= fitness./sum(fitness);
h= fortune_wheel(P);
%%%%%%%%%%%%%
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
idx=[];
Oldn=n;
if n<gmhs.HMS
    distance =Distance(indices)';
    distance = [distance indices'];
    ddd=[distance fitness(indices)'];
    mode2='newNew';
    L=length(ddd);
    solDist=calculateSolutionDistance(gmhs,indices);
        solDist(solDist==inf)=max(solDist~=inf)+1;
        solDist=solDist/(max(solDist)-min(solDist));
        solDist=[solDist indices'];
    if mode2=='newNew'
        while n<gmhs.HMS
            mxD=find(ddd(:,1)==max(ddd(:,1)));
            if length(mxD)>1
                [~,bestFit]=max(ddd(mxD,3));
                bf=find(ddd(mxD,3)==max(ddd(mxD,3)))
                if length(bf)>1
                    ttt=mxD(bf);
                    [~,ids]=max(solDist(ttt,1));
                    idx=[idx solDist(ttt(ids),2)];
                    solDist(ttt(ids),:)=[];
                    ddd(ttt(ids),:)=[];
                else
                idx=[idx ddd(mxD(bestFit),2)];
                    %     iddx = mxD(1);
                        ddd(mxD(bestFit),:)=[];
                        solDist(mxD(bestFit),:)=[];
                end
            else
                idx=[idx ddd(mxD(1),2)];
                ddd(mxD(1),:)=[];
            end
            n=n+1;
        end
        
        
        
    elseif mode2=='old'
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
        if rand<=0.5
            pdfObjDist = (1*d(:,1)+0*solDist(:,1))./1;
        else
            pdfObjDist = (0*d(:,1)+1*solDist(:,1))./1;
        end
        pdfObjDist=pdfObjDist./(max(pdfObjDist)-min(pdfObjDist));
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
%     n=n-gmhs.HMS-n;
n=Oldn;
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