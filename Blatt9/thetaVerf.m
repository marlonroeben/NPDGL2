function [ u ] = thetaVerf( A, k, theta, u_alt )
%THETAVERF 
b = u_alt -(1-theta)*k*A*u_alt;
M = eye(size(A))+theta*k*A;
u = M\b;

end

