% clear;clc;close all;
for i=1:10
    AddRequiredPaths;
    R_DHS(i) = GenerationalDistance(paretodh2,trueParetoFront,2);
    R_N2(i) = GenerationalDistance(paretoN2,trueParetoFront,2);  
    R_old(i) = GenerationalDistance(pareto_old,trueParetoFront,2);
    R_bench(i) = GenerationalDistance(pareto_bench,trueParetoFront,2);
end

% f1=figure('position',get(0, 'Screensize'));
f1=figure;
boxplot([R_bench' R_old' R_DHS' R_N2'   ],'Labels',{...
    'GMHS-BenchMark','Old GMHS','Developed GMHS','NSGA-II'});
title('GD ')


