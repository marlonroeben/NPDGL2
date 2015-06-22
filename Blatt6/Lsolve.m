function [ x ] = Lsolve( L,b )
%Löst Lx=b

x = zeros(size(L,1),1);
for i = 1:size(L,1)
   x(i) = (b(i)-sum(L(i,1:i-1)'.*x(1:i-1)))/L(i,i);
end


end

