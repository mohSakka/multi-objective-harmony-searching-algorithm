function [paretoFront,iter,pareto] = RunAlgorithmHM(gmhs,seed,w)
rng(seed);
currentObj=1;
mode='decomposition';
gmhs= GenerateInitialHarmony(gmhs);
gmhs.HM = Evaluate(gmhs,gmhs.HM,mode,currentObj);
gmhs=DetermineDomination(gmhs);
gmhs=updateExtArchive(gmhs,gmhs.HM); 

h = waitbar(1,'message')
cont=0;
imrovDiff=0;

for iter= 1:gmhs.numberOfIterations
  waitbar(1-(gmhs.numberOfIterations-iter)/gmhs.numberOfIterations,h,...
      ['improvement rate: ' num2str(seed) ' | progress: ' num2str((1-((gmhs.numberOfIterations-iter)/gmhs.numberOfIterations))*100) '%']);
%%

x1=gmhs.numberOfIterations;
x0=1;
f0=0.01;
f1=1;
x=iter;
numerate=(x1-x)*log(f0)+(x-x0)*log(f1);
dom=x1-x0;
calc=1-exp(numerate/dom);
  if rand<0
    mode='decomposition';
  else
      mode='none';
  end
    if strcmp(mode,'decomposition')
        currentObj=3-currentObj(1);
    else 
        currentObj=[1 2];
    end
  
    %%
    gmhs.HM=FastNonDominatedSort(gmhs,gmhs.HM);
%     gmhs = GMHS_SelectionOperator(gmhs)
  [gmhs,cont]=ImprovisationHM(gmhs,iter,cont,mode,currentObj,seed,w);
%   gmhs.HM=Evaluate(gmhs,gmhs.HM,mode,currentObj);
  gmhs= Selection2(gmhs,iter);
  gmhs=DetermineDomination(gmhs);
 gmhs=updateExtArchive(gmhs,gmhs.HM);
%   gmhs = Archive_SelectionOperator(gmhs)
 
  pareto=gmhs.A;
  paretoFront=[];
  for i=1:numel(pareto)
paretoFront(i,:)=pareto(i).solutionsObjectiveValues;
end
%   d =GenerationalDistance(paretoFront,TP,2)
if 0
plot(paretoFront(:,1),'bo');
else
%     figure(3);
    plot(paretoFront(:,1),paretoFront(:,2),'bo');
end

% improvementRate(iter)=1/d;
% if iter>10
%     imrovDiff=0;
%     for im=iter:-1:iter-9
%     imrovDiff=imrovDiff+abs(improvementRate(im)-improvementRate(im-1));
%     end
%     if abs(imrovDiff)==0
% %         iter=gmhs.numberOfIterations;
%         clc;
%         disp('Break because there is no improvement');
%         break;
%     end
% end
% if d<acceptedError
%     clc;
%     disp('Break because accepted error is satisfied');
%     break;
% end
% gmhs.Pc=gmhs.Pc*0.9
% gmhs.Pbw=gmhs.Pbw*0.9
% gmhs.HMCR=gmhs.HMCR^2;
% w=w*0.99;
end
close(h)
end