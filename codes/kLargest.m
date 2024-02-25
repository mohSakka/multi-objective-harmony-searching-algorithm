function idx= kLargest(a,k)
[a,idx]=sort(a, 'descend');
idx=idx(1:k);
end