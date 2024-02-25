function [gmhs cont]= ImprovisationHM(gmhs,iter,cont,mode,currentObj,seed,w)
ArSize=numel(gmhs.HM);
pdf=[];
for h=1:ArSize
    pdf=[pdf; gmhs.HM(h).solutionsObjectiveValues];
end

Leader=randi(length(gmhs.A));
Leader=gmhs.A(Leader).sols

currentObj=1;
for h=1:ArSize
    for ob=1:size(pdf,2)
        Npdf(:,ob)=(pdf(:,ob)-min(pdf(:,ob)))./(max(pdf(:,ob))-min(pdf(:,ob)));
    end
    for ob=1:size(pdf,2)
        tmp=Npdf(:,ob);
        tmp=1./tmp;
        tmp(tmp==inf)=max(tmp(tmp~=inf))+1;
        Npdf(:,ob)=tmp;
    end
    PDF=mean(Npdf,2);
    Xnew=[];
    for j=1:gmhs.Dim
        if rand < gmhs.HMCR
            if rand < gmhs.Pc
                randIdx=round(unifrnd(1,ArSize));
                Xnew(j)=gmhs.HM(randIdx).sols(j);
            else
                Xnew(j)=gmhs.HM(h).sols(j);
            end
        else
            Xnew(j)=unifrnd(gmhs.LB(j),gmhs.HB(j));
        end
        
        %         if isempty(gmhs.prevPAR)
        %             gmhs.prevPAR=gmhs.initialPAR;
        %         end
        %         PAR=gmhs.psi*gmhs.prevPAR*(1-gmhs.prevPAR); % logistic map
        %         PAR(PAR==1 || PAR==0)=0.3;
        %         gmhs.prevPAR=PAR;
        %         PAR=1/exp(iter/12);
        PAR=1;
        bw=gmhs.bw(j);
        d3=Xnew(j);
        
        %             else
        if rand<gmhs.PAR
            if rand<gmhs.Pbw
                if rand<exp(1-10*(iter/gmhs.numberOfIterations))
        obj=randi(gmhs.nObj);
        % obj=gmhs.nObj+1-currentObj;
        % currentObj=obj;
        r1= fortune_wheel(Npdf(:,obj));
        %      r1= fortune_wheel(PDF);
        % r1=randi(numel(gmhs.A));
%         crossIdx=randi(length(gmhs.HM(r1).sols));
r1(r1==-1)=randi(length(Npdf(:,obj)));
%         Xnew(j)=Xnew(j)+w*rand*(gmhs.HM(r1).sols(j)-Xnew(j));
mean2=gmhs.HM(r1).sols(j)-Xnew(j);
sigma=abs(mean2/10);
Xnew(j)=normrnd(gmhs.HM(r1).sols(j),sigma);
                else
%                     crossIdx=randi(length(gmhs.HM(1).sols));
                   Leader=randi(numel(gmhs.A));
Leader=gmhs.A(Leader).sols ;
% Xnew(j)=Xnew(j)+w*rand*(Leader(j)-Xnew(j));
mean2=Leader(j)-Xnew(j);
sigma=abs(mean2/10);
bw2=normrnd(Leader(j),sigma);
Xnew(j)=normrnd(Leader(j),sigma);
                end
        else
            %             if rand<gmhs.Pbw
            if rand<0.5
                d3= Xnew(j)+rand*bw;
            else
                d3= Xnew(j)-rand*bw;
            end
            Xnew(j)=d3;
            end
        end
        if rand<gmhs.Pgm
        Xnew(j)=normrnd(Xnew(j),gmhs.sigma_mutation(j));
        end
%         if rand<0.1
%             Xnew(j)=unifrnd(gmhs.LB(j),gmhs.HB(j));
%         end
        end % end for j
    
    
    
    
    
%     Xnew=GaussianMutation(Xnew,gmhs.Pgm,gmhs.sigma_mutation);
    Xnew=CheckBounds(Xnew,gmhs.LB,gmhs.HB);
    
    
    newObj=gmhs.objFun(Xnew);
    if strcmp(mode,'decomposition')
        if newObj(currentObj)<gmhs.HM(h).solutionsObjectiveValues(currentObj)
            newHM(h,:)=Xnew;
            newObjs(h,:)=newObj;
            cont=cont+1;
        else
            newHM(h,:)=gmhs.HM(h).sols;
            newObjs(h,:)=gmhs.HM(h).solutionsObjectiveValues;
        end
    else
        if 1%Dominates(newObj,gmhs.HM(h).solutionsObjectiveValues)
            newHM(h,:)=Xnew;
            newObjs(h,:)=newObj;
            pdf(h,:)=newObj;
            cont=cont+1;
        else
            newHM(h,:)=gmhs.HM(h).sols;
            newObjs(h,:)=gmhs.HM(h).solutionsObjectiveValues;
            
        end
    end
    gmhs.bw= gmhs.bw*gmhs.dampingBW;
        gmhs.sigma_mutation=gmhs.sigma_mutation*gmhs.dampingBW;
end
% end for h
for i=1:ArSize
    gmhs.HM(i+ArSize).sols=newHM(i,:);
    gmhs.HM(i+ArSize).solutionsObjectiveValues=newObjs(i,:);
end
end