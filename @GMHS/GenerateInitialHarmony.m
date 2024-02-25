function gmhs= GenerateInitialHarmony(gmhs)
for i=1:gmhs.HMS
gmhs.HM(i).sols=gmhs.LB+rand(1,gmhs.Dim).*(gmhs.HB-gmhs.LB);
end
gmhs.A=[];
end