 function solDist=calculateSolutionDistance2(gmhs,indices)
% adjaMat=zeros(length(indices));
%  for i=1:length(indices)
%      for j=1:length(indices)
%          if i==j
%              adjaMat(i,j)=inf;
%          else
%      adjaMat(i,j)=sum(abs(gmhs.HM(indices(i)).sols-gmhs.HM(indices(j)).sols));
%          end
%      end
%  end
%  solDist=min(adjaMat,[],2);
solDist=zeros(size(indices));
 for i=1:length(indices)
     sols(i,:)=gmhs.A(indices(i)).sols;
 end
 for i=1:gmhs.Dim
     [sortedSols id]= sortrows(sols,i);
     maxSol=sortedSols(end);
     minSol=sortedSols(1);
     solDist(id(1))=inf;
     solDist(id(end))=inf;
     for ii=2:length(indices)-1
         solDist(id(ii))=solDist(id(ii))+sum(abs(sortedSols(ii+1,:)-sortedSols(ii-1,:)));
     end
 end
    solDist=solDist';     
 end
     
     
 