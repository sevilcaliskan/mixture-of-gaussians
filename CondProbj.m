function [condprob] = CondProbj(alpha,data,mu,sigma,c,j)
prob = 0;
for i=1:c
    prob = prob + alpha(1,i)* Gauss( data , mu(i,:) , sigma(:,:,i));
end
condprob =  alpha(1,j) * Gauss( data , mu(j,:) , sigma(:,:,j))/prob ;
end
