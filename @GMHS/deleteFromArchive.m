function [gmhs,dist]= deleteFromArchive(gmhs,dist)
idx=find(dist==min(dist),1);
dist(idx)=[];
gmhs.A(idx)=[];
end