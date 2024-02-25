function HM = Evaluate(gmhs,HM,mode,currentObj)
objFun=gmhs.objFun;
% if ~strcmp(mode,'decomposition')
    for i=1:numel(HM)
        HM(i).solutionsObjectiveValues= objFun(HM(i).sols);
    end
% else
%     for i=1:numel(HM)
%         HM(i).solutionsObjectiveValues= objFun(HM(i).sols);
%          HM(i).solutionsObjectiveValues=HM(i).solutionsObjectiveValues(currentObj);
%     end
    %  HM(numel(HM)+1:end,:).solutionsObjectiveValues(numel(HM)+1:end,:)=[];
end
