function [cont,paretoFront,iter] = RunAlgorithm(gmhs,TP,acceptedError,seed)
rng(seed);
gmhs= GenerateInitialHarmony(gmhs);
gmhs.HM = Evaluate(gmhs,gmhs.HM);
gmhs=DetermineDomination(gmhs);
gmhs=updateExtArchive(gmhs,gmhs.HM);
h = waitbar(1,'message')
cont=0;
for iter= 1:gmhs.numberOfIterations
  waitbar(1-(gmhs.numberOfIterations-iter)/gmhs.numberOfIterations,h,...
      ['improvement Count: ' num2str(cont) ' | progress: ' num2str((1-((gmhs.numberOfIterations-iter)/gmhs.numberOfIterations))*100) '%']);
%   gmhs=updateExtArchive(gmhs,gmhs.HM);
  [gmhs,cont]=Improvisation(gmhs,iter,cont,seed);
  gmhs.HM=Evaluate(gmhs,gmhs.HM);
gmhs.HM = FastNonDominatedSort(gmhs,gmhs.HM)
  gmhs = GMHS_SelectionOperator(gmhs)
  gmhs.HM=Evaluate(gmhs,gmhs.HM);
  gmhs=DetermineDomination(gmhs);
gmhs=updateExtArchive(gmhs,gmhs.HM); 
  pareto=findPareto(gmhs);
  paretoFront=[];
  for i=1:numel(pareto)
paretoFront(i,:)=pareto(i).solutionsObjectiveValues;
end
%   d =GenerationalDistance(paretoFront,TP.TP7_ZDT3,2)
   for i=1:size(paretoFront,1)
plot(paretoFront(i,1),paretoFront(i,2),'bo');
hold on;
   end
hold off;
% improvementRate(iter)=d;
% if iter>10
%     imrovDiff=0;
%     for im=iter-10:iter
%     imrovDiff=imrovDiff+improvementRate(iter)-improvementRate(im)
%     end
%     if imrovDiff==0
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
end
close(h)
end