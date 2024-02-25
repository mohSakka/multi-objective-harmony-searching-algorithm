
for i=1:10
    AddRequiredPaths;
   ddh(i) = DeltaQuotMetric(paretodh2)
    dn(i) = DeltaQuotMetric(paretoN2)
%     dmohs(i)= DeltaQuotMetric(pareto_MOHS);
    dold(i) = DeltaQuotMetric(pareto_old);
    dbench(i) = DeltaQuotMetric(pareto_bench);
end
figure
boxplot([dbench'  dold' ddh',dn'],'labels',{'GMHS-BenchMark','Old GMHS',...
    'Developed GMHS','NSGA-II' });
title('Delta');
