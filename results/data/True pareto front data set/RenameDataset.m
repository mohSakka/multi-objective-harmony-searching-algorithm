clc
clear all 
datasetName = 'TP1';
load(datasetName)
TP1_SCH = TP1 ;

save(datasetName,'TP1_SCH','extreameSolution1','extreameSolution2')
