 function gmhs=updateExtArchive2(gmhs)

%  gmhs=DetermineDomination2(gmhs)
%  dominatedIndes=[];
%  for i=1:numel(gmhs.A)
%      if gmhs.A(i).IsDominated
%          dominatedIndes=[dominatedIndes i];
%      end
%  end
%  gmhs.A(dominatedIndes)=[];
 gmhs.A=FastNonDominatedSort(gmhs,gmhs.A);
 dist=[];
%  
% 
%  M = numel(gmhs.A);
%  while M > gmhs.N 
     k=M-gmhs.N;
     for i=1:numel(gmhs.A)
    dist=[dist gmhs.A(i).solutionDistance];
     end
     rr=1./rankArr;
     ddd=0.1*dist+rr;
%   rndIds=round(unifrnd(1,length(dist),1,M-gmhs.N));
 [~,idx] = mink(ddd(:),k);
 gmhs.A(idx)=[];
%  M = numel(gmhs.A);
%  end
 end
 