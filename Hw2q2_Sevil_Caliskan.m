%Sevil Caliskan - 21701423

train = [firstctrain;secondctrain;thirdctrain];
test = [firstctest;secondctest;thirdctest];

targetsvector = [ones(1,500), 2*ones(1,500), 3*ones(1,500)];
outputsvector = zeros(1,1500);

nbins = [20,20];
for i = 1:1500
    dens1 = Hist(train(i,:),firstctrain,nbins);
    dens2 = Hist(train(i,:),secondctrain,nbins);
    dens3 = Hist(train(i,:),thirdctrain,nbins);
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
    dens1 = Hist(test(i,:),firstctrain,nbins);
    dens2 = Hist(test(i,:),secondctrain,nbins);
    dens3 = Hist(test(i,:),thirdctrain,nbins);
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


