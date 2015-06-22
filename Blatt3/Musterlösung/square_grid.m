% construction of regular grid of n*n squares
% divided into triangles by the diagonal left lower - right upper corner
function [P, T, B] = square_grid(n, L)
P = zeros((n+1)^2, 2);
B = zeros((n+1)^2, 1);
T = zeros(2 * n^2 ,3);

h = L/n;
% set coordinates of gridpoints
for i = 1:n+1
    for j = 1:n+1
        P((j-1) * (n+1) + i,1) = (i-1)*h;
        P((j-1) * (n+1) + i, 2) = (j-1)*h;
        % point on boundary
        if (j == 1 || j == n+1 || i == 1 || i == n+1)
            B((j-1) * (n+1) + i) = 1;
        end
     end
end

% fill element array
for i = 1 : n
    for j = 1 : n
    T (j+ (i-1) * n,:) = [i + (j-1) * (n+1), i+ (j-1) * (n+1)+1, i+ (j-1) * (n+1)+n + 2];
    T (j+ (i-1 + n) * n ,:) = [i+ (j-1) * (n+1),i+ (j-1) * (n+1)+n + 2, i+ (j-1) * (n+1)+ n + 1];
    end
end

end
