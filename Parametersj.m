function [alp,means,covarience] = Parametersj(alpha,data,mu,sigma,c,j,s)
[n,d]=size(data);

nominatorm = zeros(1,2);
denominatorm = 0;
denominators = 0;
nominators = 0;
covarience = 0;
alp = 0;

if s==1
    for k=1:n
        prob = CondProbj(alpha,data(k,:),mu,sigma,c,j);
        nominatorm = nominatorm +prob *data(k,:);
        denominatorm = denominatorm + prob;
        alp = alp + prob;
        for i=1:c
            prob = CondProbj(alpha,data(k,:),mu,sigma,c,i)*norm(data(k,:)- mu(i,:))^2;
            covarience = covarience + prob;
        end
    end
    alp = alp/n;
    means = nominatorm / denominatorm;
    covarience = eye(d)*covarience / (2*n);
    
elseif s==2
    nominators = zeros(2,2);
    for k=1:n
        prob = CondProbj(alpha,data(k,:),mu,sigma,c,j);
        nominatorm = nominatorm +prob *data(k,:);
        denominatorm = denominatorm + prob;
        alp = alp + prob;
        for i=1:2
            nominators(i,i) = nominators(i,i) + CondProbj(alpha,data(k,:),mu,sigma,c,j)*norm(data(k,i)- mu(j,i))^2;
            denominators = denominators + CondProbj(alpha,data(k,:),mu,sigma,c,j);
        end
    end
    covarience = nominators/(denominators);
    alp = alp/n;
    means = nominatorm / denominatorm;
    
elseif s==3
    for k=1:n
        prob = CondProbj(alpha,data(k,:),mu,sigma,c,j);
        nominatorm = nominatorm +prob *data(k,:);
        denominatorm = denominatorm + prob;
        alp = alp + prob;
        nominators = nominators + CondProbj(alpha,data(k,:),mu,sigma,c,j)*transpose(data(k,:)- mu(j,:))*(data(k,:)- mu(j,:));
        denominators = denominators + CondProbj(alpha,data(k,:),mu,sigma,c,j);
    end
    covarience = nominators/(denominators);
    alp = alp/n;
    means = nominatorm / denominatorm;
end
end

