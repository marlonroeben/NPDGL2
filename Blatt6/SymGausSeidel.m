function [ x,i ] = SymGausSeidel( A,b,x0,eps,i_max)
%SYMGAUSSEIDEL 
L = tril(A,-1);
D = diag(A);
R = triu(A,1);

C = (L+diag(D))*diag(D.^-1)*(diag(D)+R);
x = x0;
i = 0;
while(norm(b-A*x) > eps && i < i_max)
   y = Lsolve(A,(C-A)*x+b);
   y = D.*y;
   x = Rsolve(A,y);
   i = i+1;
end


end

