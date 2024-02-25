function gmhs= ExtractNewHarmony(gmhs)
gmhs.HM=FastNonDominatedSort(gmhs,gmhs.HM);
end