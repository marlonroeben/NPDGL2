function [ x,i ] = GausSeidel( A,b,x0, eps,i_max)
% Gauss-Seidel Verfahren
n = size(A,2);
R = triu(A,1);

x=x0;
i=0;
L = A-R;

while(norm(A*x-b) > eps && i < i_max)
    x = Lsolve(L,-R*x+b);
    i = i+1;
end

end