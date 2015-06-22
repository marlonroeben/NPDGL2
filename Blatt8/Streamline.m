function [ u ] = Streamline( e,h, d )
%STREAMLINE

d = 0.05*h;

n = round(1/h+1);

alpha0 = -e/h-0.5+d*1/h;
alpha1 = 2*e/h-2*d*1/h;
alpha2 = -e/h+0.5+d*1/h;

A = diag(alpha1*ones(n,1),0);
A = A + diag(alpha0*ones(n-1,1),-1);
A = A + diag(alpha2*ones(n-1,1),1);

A(1,:) = eye(1,n);
A(end,:) = 0;
A(end,end) = 1;


b = eye(n,1);
u = A\b;

end
