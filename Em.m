function [alpha,mu,sigma,loglikelihood] = Em(data,c,s)
[n,~]=size(data);
[alpha,mu,sigma]= Starting(data, c);
count = 0;
alp = zeros(1,c);
mean = zeros(c,2);
covarience = zeros(2,2,c);
loglikelihood = -100000;
difference = 100;
while difference>10
    for i=1:c
        [alp(1,i),mean(i,:),covarience(:,:,i)] = Parametersj(alpha,data,mu,sigma,c,i,s);
    end
    alpha = alp;
    mu = mean;
    sigma = covarience;
    
    loglikelihoodprev=loglikelihood;
    loglikelihood = 0;
    for k=1:n
        loglik = 0;
        for i=1:c
            loglik = loglik + alpha(1,i)*Gauss(data(k,:), mu(i,:),sigma(:,:,i));
        end
        loglikelihood = loglikelihood + log(loglik);
    end
    difference = loglikelihood-loglikelihoodprev;
    count = count + 1;
end
end
