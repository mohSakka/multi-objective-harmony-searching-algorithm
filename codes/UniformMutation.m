function Xnew=UniformMutation(Xnew,Pm,LB,HB)
for j=1:length(Xnew)
    if rand<Pm
        Xnew(j)=unifrnd(LB(j),HB(j));
    else
        Xnew(j)=Xnew(j);
    end
end
end
