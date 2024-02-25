objFun={'SCH1','FON','POL','KUR','ZDT1','ZDT2','ZDT3','ZDT4','ZDT6','SCH2'};
pw=pwd;pw(pw=='\')='/';
resdh = load([pw '/../final comparison results/' objFun{problemNumber} '/scenario-' num2str(i) '.mat']);
resMohs = load([pw '/../final comparison results MOHS/' objFun{problemNumber} '/scenario-' num2str(i) '.mat']);
resOld = load([pw '/../final comparison results old GMHS/' objFun{problemNumber} '/scenario-' num2str(i) '.mat']);

resdh_bench= load([pw '/../final comparison results benchmark/' objFun{problemNumber} '/Seed ' num2str(i) '.mat']);

resn = load([pw '/../final comparison results NSGA2/Mathematical Functions/Experiments/' ...
    objFun{problemNumber} '/Scenario-' num2str(i) '/Scenario-' num2str(i) '_Benchmarck-NSGA-II.mat']);

paretoN2=resn.paretoFront.solutionsObjectiveValues;
 paretodh2=resdh.p;
pareto_bench=resdh_bench.paretoFront;
pareto_old= resOld.p;
pareto_MOHS =resMohs.paretoFront;
if problemNumber~=10
true=load([pw '/../data/True pareto front data set/TP' num2str(problemNumber) '.mat']);
trueParetoFront=eval(['true.TP' num2str(problemNumber) '_' objFun{problemNumber}]);
end