function pareto=findPareto(gmhs)
gmhs=DetermineDomination2(gmhs);
pareto=[];
 for i=1:numel(gmhs.A)
     if ~gmhs.A(i).IsDominated
         pareto=[pareto gmhs.A(i)]
     end
 end
end