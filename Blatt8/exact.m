function [ y ] = exact(x,e)
%EXACT 

y = (1-exp((x-1)./e))./(1-exp(-1/e));

end

