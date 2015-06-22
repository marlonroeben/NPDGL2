function [ u ] = Galerkin( e, h )
%GALERKIN 

n = round(1/h+1);

alpha0 = -e-0.5*h;
alpha1 = 2*e;
alpha2 = -e+0.5*h;

A = diag(alpha1*ones(n,1),0);
A = A + diag(alpha0*ones(n-1,1),-1);
A = A + diag(alpha2*ones(n-1,1),1);

A(1,:) = eye(1,n);
A(end,:) = 0;
A(end,end) = 1;


b = eye(n,1);
u = A\b;

end


