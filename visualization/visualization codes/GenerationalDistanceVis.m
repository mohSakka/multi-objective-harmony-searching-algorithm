function GenerationalDistanceVis
AddRequiredPaths;
tpn=7; % select true pareto number 
TP=load(['../data/True pareto front data set/TP' num2str(tpn) '.mat']);
trueParetoFront=TP.TP7_ZDT3;
ph=resh.p;
for i=1:numel(ph)
    pfh(i,:)=ph(i).solutionsObjectiveValues;
end
pn=resn.paretoFront;
for i=1:size(pn.solutionsObjectiveValues,1)
    pfn(i,:)=pn.solutionsObjectiveValues(i,:);
end
% p1=res1.p;
% for i=1:numel(p1)
%     pf1(i,:)=p1(i).solutionsObjectiveValues;
% end
% p9=res9.p;
% for i=1:numel(p9)
%     pf9(i,:)=p9(i).solutionsObjectiveValues;
% end
dh=GenerationalDistance(pfh,trueParetoFront,2)
dn=GenerationalDistance(pfn,trueParetoFront,2)
% d2=GenerationalDistance(pf2,trueParetoFront,2)
% d3=GenerationalDistance(pf3,trueParetoFront,2)
% d4=GenerationalDistance(pf4,trueParetoFront,2)
% d4=GenerationalDistance(pf4,trueParetoFront,2)
% d9=GenerationalDistance(pf9,trueParetoFront,2)
% d1=GenerationalDistance(pf1,trueParetoFront,2)
% d8=GenerationalDistance(pf8,trueParetoFront,2)
% d6=GenerationalDistance(pf6,trueParetoFront,2)
% d99=GenerationalDistance(pf99,trueParetoFront,2)
% d99=GenerationalDistance(pf99,trueParetoFront,2)
somedata=[ dh dn];
somenames={}%,'HMCR=0.8','HMCR=0.9','HMCR=0.99'}%,'Pc=0.6','Pc=0.7','Pc=0.8','Pc=0.9'};
bar(somedata);set(gca,'xticklabel',somenames)
% suptitle([' Generational Distanse']);
% [~,p]=ttest(C_VL_MO,C_MO_VL);
plot(pfn(:,1),pfn(:,2),'bo');hold on
plot(pfh(:,1),pfh(:,2),'ro')
SetCoverage2(pfh,pfn)
