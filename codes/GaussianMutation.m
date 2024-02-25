function Xnew=GaussianMutation(Xnew,Pgm,sigma)
for j=1:length(Xnew)
    if rand<Pgm
        Xnew(j)=normrnd(Xnew(j),sigma(j));
    else
        Xnew(j)=Xnew(j);
    end
end
end
