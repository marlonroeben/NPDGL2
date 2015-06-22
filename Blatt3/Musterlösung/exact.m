function value = exact(x)
% x might be a vector, then this is the sum of the squares of the coordinates 
value = 10 * x(1) * (1-x(1)) * x(2) * (1-x(2));
end
