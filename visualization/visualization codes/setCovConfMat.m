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
figure;
%%%%%
subplot 441
boxplot(C_DHS_N2);
ylabel('E-GMHS');
set(gca,'xTicklabels',[]);
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2);
ylim([0 1]);
%%%%
subplot 445
boxplot(C_old_N2);
ylabel('MOHS');
set(gca,'xTicklabels',[]);
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2);
ylim([0 1]);
%%%%
subplot 449
boxplot(C_bench_N2);
ylabel('GMHS');
set(gca,'xTicklabels',[]);
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2);
ylim([0 1]);
%%%%
subplot(4,4,13)
boxplot(zeros(size(C_bench_N2)));
ylabel('NSGA-II');
xlabel('NSGA-II');
set(gca,'xTicklabels',[]);
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2);
ylim([0 1]);
%%%%
subplot(4,4,2)
boxplot(C_DHS_bench);
xlabel([]);
ylabel([]);
set(gca,'xTicklabels',[]);
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2);
ylim([0 1]);
%%%%
subplot(4,4,3)
boxplot(C_DHS_old);
xlabel([]);
ylabel([]);
set(gca,'xTicklabels',[]);
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2);
ylim([0 1]);
%%%%
subplot(4,4,4)
boxplot(zeros(size(C_DHS_old)));
xlabel([]);
ylabel([]);
set(gca,'xTicklabels',[]);
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2);
ylim([0 1]);
%%%%
subplot(4,4,5)
boxplot(C_old_N2);
xlabel([]);
ylabel('MOHS');
set(gca,'xTicklabels',[]);
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2);
ylim([0 1]);
%%%%
subplot(4,4,6)
boxplot(C_old_bench);
xlabel([]);
ylabel([]);
set(gca,'xTicklabels',[]);
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2);
ylim([0 1]);
%%%%
subplot(4,4,7)
boxplot(zeros(size(C_old_bench)));
xlabel([]);
ylabel([]);
set(gca,'xTicklabels',[]);
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2);
ylim([0 1]);
%%%%
subplot(4,4,8)
boxplot(C_old_DHS);
xlabel([]);
ylabel([]);
set(gca,'xTicklabels',[]);
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2);
ylim([0 1]);
%%%%
subplot(4,4,10)
boxplot(zeros(size(C_old_DHS)));
xlabel([]);
ylabel([]);
set(gca,'xTicklabels',[]);
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2);
ylim([0 1]);
%%%%
subplot(4,4,11)
boxplot(C_bench_old);
xlabel([]);
ylabel([]);
set(gca,'xTicklabels',[]);
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2);
ylim([0 1]);
%%%%
subplot(4,4,12)
boxplot(C_bench_DHS);
xlabel([]);
ylabel([]);
set(gca,'xTicklabels',[]);
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2);
ylim([0 1]);
%%%%
subplot(4,4,14)
boxplot(C_N2_bench);
xlabel('GMHS');
ylabel([]);
set(gca,'xTicklabels',[]);
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2);
ylim([0 1]);
%%%%
subplot(4,4,15)
boxplot(C_N2_old);
xlabel('MOHS');
ylabel([]);
set(gca,'xTicklabels',[]);
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2);
ylim([0 1]);
%%%%
subplot(4,4,16)
boxplot(C_N2_DHS);
xlabel('E-GMHS');
ylabel([]);
set(gca,'xTicklabels',[]);
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2);
ylim([0 1]);
%%%%
suptitle('Set Coverage Confusion Matrix');