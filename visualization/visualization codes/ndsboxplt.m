for i=1:10
AddRequiredPaths;
gdH(i)=length(paretodh2);
gdN(i)=length(paretoN2);
gd_old(i)=length(pareto_old);
gd_bench(i)=length(pareto_bench);
end
figure;
boxplot([gd_bench'  gd_old' gdH',gdN'],'labels',...
    {'GMHS-BenchMark','Old GMHS','Developed GMHS','NSGA-II'});
title('NDS');
