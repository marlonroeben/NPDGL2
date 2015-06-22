function [u] = exact( x,y,R,L )
%EXACT Summary of this function goes here
%   Detailed explanation goes here
v1_exact = -4*y.*y./(R*R)+4*y./R;
v2_exact = zeros(size(v1_exact));
p_exact = 8/(R*R)*(L-x);
u = [v1_exact, v2_exact, p_exact];
end

