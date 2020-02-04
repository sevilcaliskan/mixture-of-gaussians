%Read data
Data = xlsread('hw2data');

%separate different class data
[r ,~]= size(Data);
firstc = zeros(0,3);
secondc = zeros(0,3);
thirdc = zeros(0,3);

for n=1:r 
    if Data(n,3) == 1
        firstc = [firstc; Data(n,:)];
    elseif Data(n,3) == 2
        secondc = [secondc; Data(n,:)];
    else
        thirdc = [thirdc; Data(n,:)];
    end
end

%For shuffling data
[n ,~]= size(secondc);
firstc = firstc(randperm(n),:); 
secondc = secondc(randperm(n),:);
thirdc = thirdc(randperm(n),:);

%separate different class data to test and train sets
n = round(n/2);
firstctrain = firstc(1:n, 1:2);
firstctest = firstc((n+1):2*n, 1:2);
secondctrain = secondc(1:n, 1:2);
secondctest = secondc((n+1):2*n, 1:2);
thirdctrain = thirdc(1:n, 1:2);
thirdctest = thirdc((n+1):2*n, 1:2);

clear firstc secondc thirdc Data r;