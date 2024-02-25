%% initialization
clear;clc;close all
p=pwd;
p(p=='\')='/';
addpath([p '/visualization codes']);
%% select problem number
problemNumber=10;
% 1-SCH1
% 2-FON
% 3-POL
% 4-KUR
% 5-ZDT1
% 6-ZDT2
% 7-ZDT3
% 8-ZDT4
% 9-ZDT6
% 10-SCH2
%% set coverage boxplot
setCovConfMat;
setCovBoxPlot
%% gd boxplot
if problemNumber~=10
gdBoxplot
end
% %% delta
deltaboxplot
 %% HV
hvboxplot
%% NDS 
ndsboxplt
 %% paretoFront
plotPareto