i=randi(10);
AddRequiredPaths
figure;
h=plot(sort(paretoN2(:,1),'descend'),sort(paretoN2(:,2),'ascend'),'b-','linewidth',1.5);
hold on;
h=plot(sort(paretodh2(:,1),'descend'),sort(paretodh2(:,2),'ascend'),'r-','linewidth',1.5);
h=plot(sort(pareto_old(:,1),'descend'),sort(pareto_old(:,2),'ascend'),'k-','linewidth',1.5);
h=plot(sort(pareto_bench(:,1),'descend'),sort(pareto_bench(:,2),'ascend'),'m-','linewidth',1.5);
legend({'NSGA-II','developed-GMHS','old-GMHS','GMHS-benchmark'});
title('paretoFront');