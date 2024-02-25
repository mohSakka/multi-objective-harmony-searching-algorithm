%% initialization and adding required paths
clear;clc;close all;
AddRequiredPaths;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Setting the parameters
w=2;
for seed=1:10
HMS=50;   % harmony memory size
N=50;     % Ext archive size
HMCR=0.99;  % HM considaration rate
Pc=0.1;    % cross probability
Pbw=0.9;   % global searching probability
PAR=0.9;  % initial pitch adjucemnt rate
Dim=1;       % solution dims
w=2;
% Lower and higher bounds
LB=-5;
LB=[LB -5*ones(1,Dim-1)];
HB=10;
HB=[HB 10*ones(1,Dim-1)]; % lower and higher bounds
bw=(HB-LB)*0.05; % pitch band width
%%%%%%%%%
dampingBW=0.99; % damping ratio for bandwidth and gaussian mutation sigma
sigma_mutation=(HB-LB)./20; % sigma value for gaussian mutation
Pgm=1/Dim; % mutation probability
if Dim==1
    Pgm = 0.1;
end
numberOfIterations=25;  %  number of iterations
objFun=@Schaffer2_objfun; % objective function
nObj=2;  % number of objectives
%% path fixing
pw=pwd;
pw(pw=='\')='/';

%% constructing gmhs object
gmhs=GMHS(HMS,N,HMCR,Pc,Pbw,bw,Dim,LB,HB,dampingBW,PAR,...
    numberOfIterations,objFun,nObj,sigma_mutation,Pgm);
%% running the algorithm
[p,iter]=RunAlgorithmHM(gmhs,seed,w);
%% saving the results
path=[pw '/final comparison results/SCH2'];
if ~exist(path, 'dir')
       mkdir(path)
end
save([path '/scenario-' num2str(seed) '.mat' ]);
end
%% the end
