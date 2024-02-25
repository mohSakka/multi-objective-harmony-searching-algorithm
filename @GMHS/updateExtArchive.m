function gmhs=updateExtArchive1(gmhs,HM)


for i=1:numel(HM)
    if ~ HM(i).IsDominated
        gmhs.A
        gmhs.A=[gmhs.A ; HM(i)];
        %          c=c+1;
    end
end


gmhs=DetermineDomination2(gmhs); % determin dominated solutions in the Archive
dominatedIndes=[];
for i=1:numel(gmhs.A)
    if gmhs.A(i).IsDominated
        dominatedIndes=[dominatedIndes i];
    end
end
gmhs.A(dominatedIndes)=[];
gmhs.A = CalculateCrowdingDistance2(gmhs,gmhs.A);
nGrid=7;alpha=0.1;
Grid=CreateGrid(gmhs.A,nGrid,alpha);
for i=1:numel(gmhs.A)
    gmhs.A(i).GridIndex=FindGridIndex(gmhs.A(i),Grid);
end

gi=zeros(1,numel( gmhs.A));
for i=1:numel(gmhs.A)
    gi(i)=gmhs.A(i).GridIndex;
end
uniq=(unique(gi));
fitness= 10*ones(1,numel(gmhs.A));
counter=zeros(1,length(uniq));
for j=1:length(uniq)
    
    for i=1:numel(gmhs.A)
        if gmhs.A(i).GridIndex==uniq(j)
            counter(j)=counter(j)+1;
        end
    end
end

for j=1:length(uniq)
    for i=1:numel(gmhs.A)
        if gmhs.A(i).GridIndex==uniq(j)
            fitness(i)=10/counter(j);
        end
    end
end
% gmhs.A=FastNonDominatedSort(gmhs,gmhs.A);
dist=[];

for i=1:numel(gmhs.A)
        dist=[dist gmhs.A(i).solutionDistance];
end
indices=1:numel(gmhs.A);
solDist=calculateSolutionDistance2(gmhs,indices);
    d=dist;
    if ~all(d==inf) 
 d(d==inf)=max(d(d~=inf))+1;
    end
     
 d=d/(max(d)-min(d)); 
 solDist(solDist==inf)=max(solDist~=inf)+1;
 solDist=solDist/(max(solDist)-min(solDist));


M = numel(gmhs.A);
while M > gmhs.N
     a=1:length(fitness);
fit=[fitness' a'];
   [mn,mmm]=min(dist);
   [~,md]=find(dist==mn);
   if length(md)>1
       tf=fit(md,:);
       [~,ii]=min(tf(:,1));
       mmdd=md(ii);
       iii=find(tf(ii,1)==tf(:,1));
       if length(iii)>1
           a=md(iii);
           [~,iiii]=min(solDist(a,1));
           idx=a(iiii);
       else
       idx=tf(ii,2);
       end
   else
       idx=mmm;
   end
    dist(idx)=[];
d(idx)=[];
solDist(idx)=[];
fitness(idx)=[];
fit(idx,:)=[];
    gmhs.A(idx)=[]; % delete the minimum distance sols
    M = numel(gmhs.A);
end
end
% while M > gmhs.N
%     k=M-gmhs.N;
%     if rand<0
%     [~,idx] = mink(dist,k);
%     else
%  if rand<0
%      pdfObjDist = (0*d+1*solDist')./1;
%      else
%      pdfObjDist = (d')./1;
%  end
%      pdfObjDist(pdfObjDist==inf)=max(pdfObjDist(pdfObjDist~=inf))+1;
% %  end
%   pdfObjDist=pdfObjDist./(max(pdfObjDist)-min(pdfObjDist));
% 
% idx=fortune_wheel(1./pdfObjDist);
%  [~,idx] = mink(pdfObjDist,k);
%     end
% dist(idx)=[];
% d(idx)=[];
% solDist(idx)=[];
%     gmhs.A(idx)=[]; % delete the minimum distance sols
%     M = numel(gmhs.A);
% end

