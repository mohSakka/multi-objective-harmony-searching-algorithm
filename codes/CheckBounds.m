function Xnew=CheckBounds(Xnew,LB,HB)
tmp1=unifrnd(LB,HB);
tmp2=unifrnd(LB,HB);
Xnew(Xnew<LB)=LB(Xnew<LB);
Xnew(Xnew>HB)=HB(Xnew>HB);
end