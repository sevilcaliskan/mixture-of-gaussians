function [alpha, means, sigmasq] = Starting(data, c)
[n,~]=size(data);
means = zeros(c,2);
count = zeros(c,1);

clust=kmeans(data,c);
for i=1:n
    for k=1:c
        if clust(i,1)==k
            means(k,:)= means(k,:)+data(i,:);
            count(k,1)= count(k,1)+1;
        end
    end
end
means = means./count;

sigmasq = zeros(2,2,c);
sigma=0;
for i=1:n %same sphrecal covarience starting value
    sigma = sigma + (data( n, 1) - means(1,1))^2 + (data( n, 2) - means(1,2))^2;
end
sigma = sigma/(2*n);

for i=1:c 
    sigmasq(:,:,i) = sigma*eye(2);
end


alpha = zeros(1,c);
for i=1:c % starting alpha value
    alpha (1,i) = 1 / c;
end
end