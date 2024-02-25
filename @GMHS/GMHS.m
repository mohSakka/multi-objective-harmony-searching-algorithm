classdef GMHS
properties (SetAccess = private)
HMS; % harmony memory size
N ;  % External Archive Size
HMCR % Harmony memory considaration ratio
Pc   % cross probability
Pbw  % band width switching probability 
bw % minimum band width
Dim  % harmony dimension
LB % lower bounds
HB % higher bounds
dampingBW % alpha for ICMIC map
PAR % initial pitch adjusement ratio
numberOfIterations; % number of iterations
objFun; % objective function
nObj; % number of objectives
HM; % Harmony memory
A; % External archive
sigma_mutation;
Pgm;
solutionsObjectiveValues % solutions objectives values 
solutionsRank  % solution rank
solutionDistance; 
end
methods
    % Constructor
function gmhs = GMHS(HMS, N, ...
HMCR, Pc,Pbw,bw,Dim,LB,HB,dampingBW,PAR...
,numberOfIterations,objFun,nObj,sigma_mutation,Pgm)
if nargin > 0 gmhs.HMS = HMS; end
if nargin > 1 gmhs.N = N; end
if nargin > 2 gmhs.HMCR = HMCR; end
if nargin > 3 gmhs.Pc = Pc; end
if nargin > 4 gmhs.Pbw = Pbw; end
if nargin > 5 gmhs.bw = bw; end
if nargin > 6 gmhs.Dim = Dim; end
if nargin > 7 gmhs.LB = LB; end
if nargin > 8 gmhs.HB = HB; end
if nargin > 9 gmhs.dampingBW = dampingBW; end
if nargin > 10 gmhs.PAR = PAR; end
if nargin > 11 gmhs.numberOfIterations = numberOfIterations; end
if nargin > 12 gmhs.objFun = objFun; end
if nargin > 13 gmhs.nObj = nObj; end
if nargin > 14 gmhs.sigma_mutation = sigma_mutation; end
if nargin > 15 gmhs.Pgm = Pgm; end
end 
[paretoFront,iter,pareto] =RunAlgorithmHM(gmhs,seed,w)
gmhs = GenerateInitialHarmony(gmhs);  % initialization Function
HM = Evaluate(gmhs,HM,mode,currentObj);                 % evaluation function
HM = FastNonDominatedSort(gmhs,HM);
dominationMatrix = CalculateDominationMatrix(gmhs,HM);  
dominationInfo = FindDominationInfo(gmhs,HM,dominationMatrix);
HM = CalculateCrowdingDistance(gmhs,HM,front);
state = IsDominant(gmhs,solution1ObjValues,solution2ObjValues);
[cont,paretoFront,iter] = RunAlgorithm(gmhs,TP,acceptedError,seed);
[gmhs,cont]= Improvisation(gmhs,iter,cont);
gmhs = GMHS_SelectionOperator(gmhs);
gmhs=DetermineDomination(gmhs);
gmhs= ExtractNewHarmony(gmhs);
[gmhs dist]= deleteFromArchive(gmhs,dist);
Ar = FastNonDominatedSortArchive(Ar);
[front,HM] = FindRankedParetoFronts(gmhs,HM,dominationInfo);
gmhs=DetermineDomination2(gmhs);
 pareto=findPareto(gmhs);
 
% d=Dominates(sob1,sob2);
end
end