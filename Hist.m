function [density] = Hist(data,traindata,nbins)
[n,~] = size(traindata);
x = traindata(:,1);
y = traindata(:,2);
[N,Xedges,Yedges] = histcounts2(x,y,nbins);
[~,r1] = size(Xedges);
[~,r2] = size(Yedges);
b1=0;
b2=0;
v1=1;
v2=1;

for i=1:(r1-1)
    if Xedges(i) <= data(1,1) && data(1,1) < Xedges(i+1)
        b1 = i;
        v1 = Xedges(i+1)- Xedges(i);
    end
end
for j=1:(r2-1)
    if Yedges(j) <= data(1,2) && data(1,2) < Yedges(j+1)
        b2 = j;
        v1 = Yedges(j+1)-Yedges(j);
    end
end

if b1>0 && b2>0
    density = N(b1,b2)/(n*v1*v2);
else 
    density = 0;
end
end
