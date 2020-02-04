function [prob] = Gauss(data,mu,sigma)
    [r,~]= size(sigma);
    prob =   1/((2*pi)^(r/2)* det(sigma)^(1/2))*exp((-1/2)*(data - mu)*sigma^(-1)*transpose(data - mu)) ;
end