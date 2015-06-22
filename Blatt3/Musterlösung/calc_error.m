% function to calculate L1 error 
function error = calc_error(T, P, sol, exact)
error = zeros(size(T,1),1);
    for i = 1: size(T,1)
       % size of element
       A = [1 P(T(i,1),1) P(T(i,1),2); 1 P(T(i,2),1) P(T(i,2),2); 1 P(T(i,3),1) P(T(i,3),2)]';
       area = 0.5 * abs(det(A));
       point = 1/2 * [P(T(i,1),:) + P(T(i,2),:); P(T(i,2),:) + P(T(i,3),:); P(T(i,1),:) + P(T(i,3),:)];   
       
       % edge midpoint rule
       error ( i ) = area/3 * ...
       (abs(0.5*(sol(T(i,1))+ sol(T(i,2)))- exact(point(1,:))) ...
       + abs(0.5*(sol(T(i,2))+ sol(T(i,3)))- exact(point(2,:)))...
       + abs(0.5*(sol(T(i,1))+ sol(T(i,3)))- exact(point(3,:))));
    end
end

