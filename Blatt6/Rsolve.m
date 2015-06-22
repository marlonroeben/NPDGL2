function [ x ] = Rsolve( R,b )
%RSOLVE 

n = size(R,1);
x = zeros(n,1);

for i = n:-1:1
    x(i) = (b(i)-sum(R(i,i+1:n)'.*x(i+1:n)))/R(i,i);
end


end

