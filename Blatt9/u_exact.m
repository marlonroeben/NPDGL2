function [ u ] = u_exact( t, gamma )
%U_EXACT

u = [1./exp(10.^(gamma)*t)+sin(t); ...
    1./exp(10.^(gamma)*t); ...
    cos(t); ...
    1./exp(t)];


end

