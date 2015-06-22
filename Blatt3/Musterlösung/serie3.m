close all;
% constants
dim = 2; % dimension
L = 1.0; % size of square
NoE = 5; % number of elements per "line"
h = L/NoE; % length of element

% grid construction 

[coordinates, triangles, boundary] = square_grid(NoE, L);
% plot grid 
figure;
triplot(triangles, coordinates(:,1), coordinates(:,2));

% calculate boundary values
 
Dirichlet = zeros(size(coordinates, 1), 1);

for i = 1 : size(boundary,1)
   if boundary(i) == 1     
       Dirichlet(i) = u_Dirichlet(coordinates(i,:));
   end
end

% finite element solution
sol = fem(triangles, coordinates, boundary, Dirichlet, @f);

% error
err = calc_error(triangles, coordinates, sol, @exact);

% plot solution
figure;
trisurf(triangles, coordinates(:,1), coordinates(:,2), sol);

% plot error
figure;
A=zeros(3,size(triangles,1),2);
for i=1:size(triangles,1)
    A(:,i,1)=coordinates(triangles(i,:),1);
    A(:,i,2)=coordinates(triangles(i,:),2);
end
patch(A(:,:,1),A(:,:,2),err');

% plot exact solution
x = (0:0.05:L)';
sol_exact = zeros(size(x,1));
for i = 1:size(x,1)
    for j =1:size(x,1)
        sol_exact(i,j) = exact([x(i) x(j)]);
    end
end
figure;
surf(x, x, sol_exact)


