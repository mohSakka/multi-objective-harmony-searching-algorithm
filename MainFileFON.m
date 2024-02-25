%% initialization and adding required paths
clear;clc;close all;
AddRequiredPaths;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Setting the parameters
for seed=1:10
HMS=50;   % harmony memory size
N=50;     % Ext archive size
HMCR=0.99;  % HM considaration rate
Pc=0.1;    % cross probability
Pbw=0.9;   % global searching probability
PAR=0.9;  % initial pitch adjucemnt rate
Dim=2;       % solution dims
w=2;
% Lower and higher bounds
LB=-4;
LB=[LB -4*ones(1,Dim-1)];
HB=4;
HB=[HB 4*ones(1,Dim-1)]; % lower and higher bounds
bw=(HB-LB)*0.05; % pitch band width
%%%%%%%%%
dampingBW=0.99; % damping ratio for bandwidth and gaussian mutation sigma
sigma_mutation=abs((HB-LB)./20); % sigma value for gaussian mutation
Pgm=1/Dim;  % mutation probability
if Dim == 1
    Pgm = 0.1;
end
numberOfIterations=25;  %  number of iterations
objFun=@FonsecaFleming_objfun; % objective function
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
path=[pw '/final comparison results/FON'];
if ~exist(path, 'dir')
       mkdir(path)
end
save([path '/scenario-' num2str(seed) '.mat' ]);
end
%% the end
