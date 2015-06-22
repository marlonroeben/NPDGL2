function [ delta ] = Defekt( A,b,x )
%DEFEKT 

n = size(A,1);

r = -A*x+b;
delta = Lsolve(A,r);

end

