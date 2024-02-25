function HvVisualizationComp()

AddRequiredPaths;
tpn=7; % select true pareto number 
TP=load(['../data/True pareto front data set/TP' num2str(tpn) '.mat']);
trueParetoFront=TP.TP7_ZDT3;
p0=res00.p;
for i=1:numel(p0)
    pf0(i,:)=p0(i).solutionsObjectiveValues;
end
p1=res01.p;
for i=1:numel(p1)
    pf1(i,:)=p1(i).solutionsObjectiveValues;
end
p2=res02.p;
for i=1:numel(p2)
    pf2(i,:)=p2(i).solutionsObjectiveValues;
end
p3=res03.p;
for i=1:numel(p3)
    pf3(i,:)=p3(i).solutionsObjectiveValues;
end
p4=res04.p;
for i=1:numel(p4)
    pf4(i,:)=p4(i).solutionsObjectiveValues;
end
p5=res05.p;
for i=1:numel(p5)
    pf5(i,:)=p5(i).solutionsObjectiveValues;
end
p6=res06.p;
for i=1:numel(p6)
    pf6(i,:)=p6(i).solutionsObjectiveValues;
end
p7=res07.p;
for i=1:numel(p7)
    pf7(i,:)=p7(i).solutionsObjectiveValues;
end
p8=res08.p;
for i=1:numel(p8)
    pf8(i,:)=p8(i).solutionsObjectiveValues;
end
p9=res09.p;
for i=1:numel(p9)
    pf9(i,:)=p9(i).solutionsObjectiveValues;
end

somedata=[HyperVolume(pf0),HyperVolume(pf1),HyperVolume(pf2) ...
    HyperVolume(pf3) HyperVolume(pf4) HyperVolume(pf5) HyperVolume(pf6)...
    HyperVolume(pf7) HyperVolume(pf8) HyperVolume(pf9) ]

somenames={'Pc=0', 'Pc=0.1','Pc=0.2','Pc=0.3','Pc=0.4','Pc=0.5','Pc=0.6','Pc=0.7','Pc=0.8','Pc=0.9'};

bar(somedata);title('Hyper Volume');
set(gca,'xticklabel',somenames)
suptitle('HV')

end







