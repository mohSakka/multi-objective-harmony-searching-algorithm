function   SetCoverageVisualizationComp()
objFuns={'ZDT1', 'ZDT2','ZDT3','ZDT4','ZDT6','FON','KUR','POL','SCH1'}
for i=1:10
AddRequiredPaths;
C_H_N(i)=SetCoverage2(paretoHS,paretoN2);
C_N_H(i)=SetCoverage2(paretoN2,paretoHS);
end
% somedata=[SetCoverage2(paretoHS,paretoN2) SetCoverage2(paretoN2,paretoHS) ];
% somenames={'c(HS,N2)', 'c(N2,HS)'};
figure;
boxplot([C_H_N',C_N_H'],'labels',{'C(HS,NSGA-II)','C(NSGA-II,HS)'});
% bar(somedata);set(gca,'xticklabel',somenames)
% set(gca,'yticklabel',objFuns)

end