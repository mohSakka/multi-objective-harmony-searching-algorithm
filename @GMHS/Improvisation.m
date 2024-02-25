function [gmhs cont]= Improvisation(gmhs,iter,cont)
ArSize=numel(gmhs.HM);
for h=1:ArSize
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
        
        if isempty(gmhs.prevPAR)
            gmhs.prevPAR=gmhs.initialPAR;
        end
        PAR=gmhs.psi*gmhs.prevPAR*(1-gmhs.prevPAR); % logistic map
        PAR(PAR==1 || PAR==0)=0.3;
        gmhs.prevPAR=PAR;
        PAR=0.3;
        if rand<=PAR
            if rand<=gmhs.Pbw
                bw1Max=(gmhs.HB(j)-gmhs.LB(j))/(2*ArSize);
                firstTerm=gmhs.bw1Min;
                secondTerm=(bw1Max-gmhs.bw1Min);
                thirdTerm=((gmhs.numberOfIterations-iter)/gmhs.numberOfIterations)^gmhs.phi;
                bw1= firstTerm + secondTerm*thirdTerm;
                if isempty(gmhs.prevGama1)
                    gmhs.prevGama1=gmhs.initialGama1;
                end
                Gama1=sin(gmhs.alpha/gmhs.prevGama1);
                Gama1(Gama1==1 || Gama1==0)=0.3;
                gmhs.prevGama1=Gama1;
                Xnew(j)=Xnew(j)+bw1*Gama1;
            else
                if isempty(gmhs.prevGama2)
                    gmhs.prevGama2=gmhs.initialGama2;
                end
                Gama2=sin(gmhs.alpha/gmhs.prevGama2);
                Gama2(Gama2==1 || Gama2==0)=0.3;
                gmhs.prevGama2=Gama2;
                r1= round(unifrnd(1,ArSize))
                r2= round(unifrnd(1,ArSize))
                
                while r1==r2
                    if ArSize==1
                        break;
                    end
                    r2= round(unifrnd(1,ArSize));
                end
                mean=abs(gmhs.HM(r1).sols(j)-gmhs.HM(r2).sols(j))
                sigma=abs(mean/10);
                bw2=normrnd(mean,sigma);
                Xnew(j)=Xnew(j)+bw2*Gama2;
            end  
        end

%     if rand<=PAR
% %      DELTA=gmhs.FW(j)*unifrnd(-1,+1);    % Uniform
%      DELTA=gmhs.FW(j)*randn();            % Gaussian (Normal) 
%      Xnew(j)=Xnew(j)+DELTA;
%     end
    end
Xnew=CheckBounds(Xnew,gmhs.LB,gmhs.HB);
Xnew=GaussianMutation(Xnew,gmhs.Pgm,gmhs.sigma_mutation);
% Xnew=UniformMutation(Xnew,gmhs.Pgm,gmhs.LB,gmhs.HB);
Xnew=CheckBounds(Xnew,gmhs.LB,gmhs.HB);
newObj=gmhs.objFun(Xnew);
if Dominates(newObj,gmhs.HM(h).solutionsObjectiveValues)
    newHM(h,:)=Xnew;
    cont=cont+1;
else
    newHM(h,:)=gmhs.HM(h).sols;
end
end
for i=1:ArSize
gmhs.HM(i+ArSize).sols=newHM(i,:);
end
end






        

                
                
                
                
                