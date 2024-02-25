# multi-objective-harmony-searching-algorithm
This repository contains matlab implementation code for the paper "Dai, X., Yuan, X. and Wu, L., 2017. A novel harmony search algorithm with gaussian mutation for multi-objective optimization. Soft Computing, 21(6), pp.1549-1567." 

note:"RunAlgorithmHM and improvisationHM are the current versions and they named with "HM" 
in the last because they are based on "HM" by the same time that "RunAlgorithm" and "Improvisation"
depend on Ext Archive 

%% visualization:
go to visulaization/MainFile

%%%%%%%%%%%%%%%%%%%%%%%%%%%% for using this project
you can edit any MainFile_"testingFunction" and rename it
** Algorithm parameters to set:
1- HMS // harmony memory size
2- N   // External archive size
3- HMCR // harmony memory consideration ratio
4- Pc   // cross probability
5- Pbw  // global search switch
6- PAR   // pitch adjuctement ratio
7- LB,HB  // lower and higher bounds
8- bw     // bandwidth for pitch adjuctement
9- dampingBW // damping ratio for bandwidth and gaussian mutation sigma
10- sigma_mutation // gaussian mutation sigma
11- Pgm   // gaussian mutation probability
12- numberOfIterations // number of iterations
13- objFun  // objective function
14- nObj // number of objectives

*** parameters for tuning:
HMCR  range : [0,1] // higher value leads to more memory consideration
Pc    range : [0,1] // lower value leads to more solutions interaction
Pbw   range : [0,1] // higher value means more global search
PAR    range : [0,1] // higher value means more pitch adjuctement chance
bw     any value : usualy less than (HB-LB)*0.1, higher value may leads to oscillation
dampingBW  range: [0,1] // usualy 1 or 0.99 
sigma_mutation : usually (HB-LB)*0.1 or lower
Pgm   range :[0,1] //  higher value means higher mutation rate
