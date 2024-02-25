clear all
clc
%%
datasetName = 'TP1';
load(datasetName)

% te=TruePareto_ZDT3;
% TruePareto_ZDT3 =[];
% TruePareto_ZDT3(:,1)= te(:,2);
% TruePareto_ZDT3(:,2)= te(:,1);

[minVal1,ind1] = min(TruePareto_Schaffer_fun (:,1));
[minVal2,ind2] = min(TruePareto_Schaffer_fun(:,2));

extreameSolution1 = round( TruePareto_Schaffer_fun(ind1,:));
extreameSolution2 = round(TruePareto_Schaffer_fun(ind2,:));

% if ~isequal(extreameSolution1,TruePareto_Schaffer_fun(1,:))
%     TruePareto_Schaffer_fun= [extreameSolution1;TruePareto_Schaffer_fun];
% 
% end
% 
% if  ~isequal(extreameSolution2,TruePareto_Schaffer_fun(end,:))
%         TruePareto_Schaffer_fun= [TruePareto_Schaffer_fun;extreameSolution2];
% end

save(datasetName,'TruePareto_Schaffer_fun','extreameSolution1','extreameSolution2')
