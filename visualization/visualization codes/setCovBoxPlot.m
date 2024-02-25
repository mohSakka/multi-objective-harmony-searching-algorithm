% clear;close all;

for i=1:10
    AddRequiredPaths;
        C_DHS_bench(i) = SetCoverage2(paretodh2,pareto_bench);
    C_bench_DHS(i) = SetCoverage2(pareto_bench,paretodh2);
    C_DHS_old(i) = SetCoverage2(paretodh2,pareto_old);
    C_old_DHS(i) = SetCoverage2(pareto_old,paretodh2);
    C_DHS_N2(i) = SetCoverage2(paretodh2,paretoN2);
    C_N2_DHS(i) = SetCoverage2(paretoN2,paretodh2);
    C_bench_old(i) = SetCoverage2(pareto_bench,pareto_old);
    C_old_bench(i) = SetCoverage2(pareto_old,pareto_bench);
    C_bench_N2(i) = SetCoverage2(pareto_bench,paretoN2);
    C_N2_bench(i) = SetCoverage2(paretoN2,pareto_bench);
           C_old_N2(i) = SetCoverage2(pareto_old,paretoN2);
    C_N2_old(i) = SetCoverage2(paretoN2,pareto_old);
end
colors = [0 0 1;1 0 0; 0 1 0;1 1  0;1 0.5 0;0 0 0; 0.47 0.25 0.04; 0 0.99 0.68;...
    0.02 0.23 0.09 ; 0.65 0.08 0.82;1 0 0.4;0.15 0.13 0.32 ;0.55 0.55 0.53;...
    0.51 0.51 0; 0.93 0.49 0.35;0.23 0.39 0.37;0.91 0.6 0.93; 0.23 0.02 0.12;...
    0.38 0.83 0.92; 0.02 0.05 0.31]; 
f1=figure;
boxplot([C_DHS_bench' C_bench_DHS'   C_DHS_old' C_old_DHS' ...
   C_DHS_N2' C_N2_DHS'  C_bench_old' C_old_bench'...
   C_bench_N2' C_N2_bench' C_old_N2' C_N2_old' ],...
    'Colors',colors);
title('set coverage')
Lgnd={'C(developed-GMHS,GMHS-benchMark)','C(GMHS-benchMark,developed-GMHS)'...
    ,...
    'C(developed-GMHS,old-GMHS)','C(old-GMHS,developed-GMHS)',...
    'C(developed-GMHS,NSGA-II)','C(NSGA-II,developed-GMHS)',...
    'C(GMHS-benchMark,old_GMHS)','C(old_GMHS,GMHS-benchMark)',...
    'C(GMHS-benchMark,NSGA-II)','C(NSGA-II,GMHS-benchMark)',...
     'C(old_GMHS,NSGA-II)','C(NSGA-II,old_GMHS)'};
 boxes = findobj(gca, 'Tag', 'Box');
legend(boxes([end:-1:1]), Lgnd,'Location','NorthEastOutside');
set(gca,'linew',3)
%%%%%%%%%%
 h = findobj('tag','Box');
    n=length(h);
    for k=1:n
    set(h(k),'linewidth',2);
    end
% [~,p]=ttest(C_DHS_N2,C_N2_DHS);
% msgbox(['set cov ttest is:' num2str(p)],'Output Params');

