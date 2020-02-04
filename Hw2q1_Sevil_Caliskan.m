%Sevil Caliskan - 21701423
for m=1:3
[alpha1,mu1,sigma1,loglikelihood1] = Em(firstctrain,6,m);
[alpha2,mu2,sigma2,loglikelihood2] = Em(secondctrain,4,m);
[alpha3,mu3,sigma3,loglikelihood3] = Em(thirdctrain,4,m);

Density1 = @(x) Density(alpha1, x, mu1, sigma1, 6);
Density2 = @(x) Density(alpha2, x, mu2, sigma2, 4);
Density3 = @(x) Density(alpha3, x, mu3, sigma3, 4);

train = [firstctrain;secondctrain;thirdctrain];
test = [firstctest;secondctest;thirdctest];

targetsvector = [ones(1,500), 2*ones(1,500), 3*ones(1,500)];

outputsvector = zeros(1,1500);

for i = 1:1500
    dens1 = Density1(train(i,:));
    dens2 = Density2(train(i,:));
    dens3 = Density3(train(i,:));
    if dens1>=dens2 && dens1>=dens3
        outputsvector(1,i) = 1;
    else
        if dens2>dens3
            outputsvector(1,i)=2;
        else
            outputsvector(1,i)=3;
        end
    end
end

% Convert this data to a [numClasses x 1500] matrix
targets = zeros(3,1500);
outputs = zeros(3,1500);
targetsIdx = sub2ind(size(targets), targetsvector, 1:1500);
outputsIdx = sub2ind(size(outputs), outputsvector, 1:1500);
targets(targetsIdx) = 1;
outputs(outputsIdx) = 1;
% Plot the confusion matrix for a 3-class problem
figure
plotconfusion(targets,outputs)


for i = 1:1500
    dens1 = Density1(test(i,:));
    dens2 = Density2(test(i,:));
    dens3 = Density3(test(i,:));
    if (dens1>=dens2) && (dens1>=dens3) 
        outputsvector(1,i) = 1;
    else
        if dens2>dens3
            outputsvector(1,i)=2;
        else
            outputsvector(1,i)=3;
        end
    end
end

% Convert this data to a [numClasses x 1500] matrix
targets = zeros(3,1500);
outputs = zeros(3,1500);
targetsIdx = sub2ind(size(targets), targetsvector, 1:1500);
outputsIdx = sub2ind(size(outputs), outputsvector, 1:1500);
targets(targetsIdx) = 1;
outputs(outputsIdx) = 1;
% Plot the confusion matrix for a 3-class problem
figure
plotconfusion(targets,outputs)
end