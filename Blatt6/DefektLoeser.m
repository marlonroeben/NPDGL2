function [ x, i ] = DefektLoeser( A,b,x0,eps,i_max )
%DEFEKTLOESER

x = x0;
i = 0;
while(norm(A*x-b) > eps && i < i_max)
    x = x+Defekt(A,b,x);
    i = i+1;
end

end

