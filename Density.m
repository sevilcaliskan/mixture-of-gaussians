function [density] = Density(alpha,data,mu,sigma,c)
density =0;
for i = 1:c
    density = density + alpha(1,i)*Gauss(data, mu(i,:),sigma(:,:,i));
end
end
