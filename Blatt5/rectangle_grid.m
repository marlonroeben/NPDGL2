% construction of regular grid of n*n squares
% divided into triangles by the diagonal left lower - right upper corner
function [P, T, B] = rectangle_grid(h, L, R)
n_x = L/h;
n_y = R/h;
P = zeros((n_x+1)*(n_y+1), 2);
B = zeros((n_x+1)*(n_y+1), 1);
T = zeros(2 * (n_x)*(n_y) ,3);

% set coordinates of gridpoints
for i = 1:n_x+1
    for j = 1:n_y+1
        P((j-1) * (n_x+1) + i, 1) = (i-1)*h;
        P((j-1) * (n_x+1) + i, 2) = (j-1)*h;
        % point on boundary: 1 für Wand, 2 für in, 3 für out
        if (j == 1 || j == n_y+1)
            B((j-1) * (n_x+1) + i) = 1;
        elseif(i==1)
            B((j-1) * (n_x+1) + i) = 2;
        elseif(i==n_x+1)
            B((j-1) * (n_x+1) + i) = 3;
        end
     end
end

% fill element array
for i = 1 : n_y
    for j = 1 : n_x
        k = j + (i-1)*(n_x+1);
        k_ = j + (i-1)*(n_x);
    T (k_ ,:) = [k, k+1, k+2+n_x];
    T (k_ + (n_x * n_y) ,:) = [k,k+n_x+1, k+n_x+2];
    end
end

end
