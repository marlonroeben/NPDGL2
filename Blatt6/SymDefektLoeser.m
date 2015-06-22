function [ x, i ] = SymDefektLoeser( A,b,x0,eps,i_max )
%SYMDEFEKTLOESER

x = x0;
i = 0;
while(norm(A*x-b) > eps && i < i_max)
    x = x+SymDefekt(A,b,x);
    i = i+1;
end

end

