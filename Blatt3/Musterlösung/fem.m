function solution = fem(T, P, boundary, Dirichlet, rhs)
  solution = zeros(size(P,1),1);
  
  stiffness = zeros( size(P,1) );
  right_hand = zeros( size(P,1), 1);
  
  % assemble global stiffness matrix and RHS
  for i = 1:size(T,1)
     
      stiffness(T(i,:), T(i,:)) = stiffness( T(i,:), T(i,:) ) ...
          + localstiffness(P(T(i,1),:), P(T(i,2),:), P(T(i,3),:));
      
      right_hand(T(i,:)) = right_hand(T(i,:)) ...
          + local_rhs(rhs, P(T(i,1),:), P(T(i,2),:), P(T(i,3),:));
  end

  
  % include Dirichlet boundary data
  right_hand = right_hand - stiffness * Dirichlet;

  DirichletNodes = find(boundary == 1);
  freeNodes = setdiff(1:size(P,1),DirichletNodes); 
  
  % do not solve on homogeneous Dirichlet boundary
  solution(freeNodes) = stiffness(freeNodes, freeNodes)\right_hand(freeNodes);
  
  solution(DirichletNodes) = Dirichlet(DirichletNodes);
  
end

% assmeble local stiffness matrix
function local = localstiffness(p1, p2, p3)
    local = zeros(3,3);
    
    for i = 1:3
        for j = 1:3
            local(i, j) = quadrature(@(x)p1_basis_grad(x,i), @(x)p1_basis_grad(x,j), p1, p2, p3);
        end
    end
end

% quadrature rule for local stiffness matrix
function value = quadrature(phi1, phi2, p1, p2, p3)
    area = 0.5;

    q_points = [ 0 0; 1 0; 0 1];
    q_weights = ones(3,1) * area/3;     
    
    value = 0.0;
    trafo = [p2-p1; p3-p1]';
    for q = 1 : size(q_points,1)
        value = value + q_weights(q) * integral(phi1, phi2, trafo, q_points(q,:));
    end
end

% function/integral to be computed by the quadrature rule
function value = integral(phi1, phi2, Phi, pq)

    determinant = abs(det(Phi));
    Phi = inv(Phi)';
    value = dot(Phi * phi1(pq)',  Phi * phi2(pq)') * determinant;

end

% assemble of local right-hand side
function local = local_rhs(rhs, p1, p2, p3)
    local = zeros(3,1);
    
    local(1) = quadrature_rhs(rhs, p1, p1, p2, p3);
    local(2) = quadrature_rhs(rhs, p2, p1, p2, p3);
    local(3) = quadrature_rhs(rhs, p3, p1, p2, p3);
end

% function/integral to be computed by the quadrature rule for rhs
function value = quadrature_rhs(f, p, p1, p2, p3)
   A = [1 p1; 1 p2; 1 p3]';
   area = 0.5 * abs(det(A));
   weight = area/3;     
   value = weight * f(p);
end
