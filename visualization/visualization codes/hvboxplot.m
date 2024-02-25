% clear;clc;close all;

for i=1:10
    AddRequiredPaths;
    maxN2=max(paretodh2);
    maxDH=max(paretodh2);
    maxOld = max(pareto_old);
    maxBench= max(pareto_bench);
    maxPoints = [maxN2;maxDH;maxOld;maxBench];
    refPoint = max(maxPoints);
   hvh(i) = HyperVolume(paretodh2,refPoint)
    hvn(i) = HyperVolume(paretoN2,refPoint)
    hvold(i) = HyperVolume(pareto_old,refPoint)
    hvbenh(i) = HyperVolume(pareto_bench,refPoint)

end
figure
boxplot([hvbenh' hvold' hvh',hvn'],'labels',{'GMHS-BenchMark','Old GMHS',...
    'Developed GMHS','NSGA-II'});
title('HV');
