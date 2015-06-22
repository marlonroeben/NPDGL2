function [ delta ] = SymDefekt( A,b,x )
%SYMDEFEKT 

n = size(A,1);
L = tril(A,-1);
D = diag(A);
R = triu(A,1);

C = (L+diag(D))*diag(D.^-1)*(diag(D)+R);

r = -A*x+b;
y = Lsolve(L+diag(D),r);
y = D.*y;
delta = Rsolve(R+diag(D),y);


end


