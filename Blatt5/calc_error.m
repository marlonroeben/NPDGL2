% function to calculate L2 error 
function error = calc_error(T, P, sol, exact, rad, len)
error = zeros(size(T,1),1);
n = size(P,1);
    for i = 1: size(T,1)
       % size of element
       A = [1 P(T(i,1),1) P(T(i,1),2); 1 P(T(i,2),1) P(T(i,2),2); 1 P(T(i,3),1) P(T(i,3),2)]';
       area = 0.5 * abs(det(A));
       point = 1/2 * [P(T(i,1),:) + P(T(i,2),:); P(T(i,2),:) + P(T(i,3),:); P(T(i,1),:) + P(T(i,3),:)];   
       
       % edge midpoint rule
       u1 = exact(point(1,1),point(1,2), rad, len);
       u2 = exact(point(2,1),point(1,2), rad, len);
       u3 = exact(point(3,1),point(1,2), rad, len);
       error ( i ) = area/3 * ...
       (abs(0.5*(sol(T(i,1))+ sol(T(i,2)))- u1(1)) ...
       + abs(0.5*(sol(T(i,2))+ sol(T(i,3)))- u2(1))...
       + abs(0.5*(sol(T(i,1))+ sol(T(i,3)))- u3(1)));
       error(i) = error(i)+area/3 * ...
       (abs(0.5*(sol(T(i,1)+n)+ sol(T(i,2)+n))- u1(2)) ...
       + abs(0.5*(sol(T(i,2)+n)+ sol(T(i,3)+n))- u2(2))...
       + abs(0.5*(sol(T(i,1)+n)+ sol(T(i,3)+n))- u3(2)));
       error(i) = error(i)+area/3 * ...
       (abs(0.5*(sol(T(i,1)+2*n)+ sol(T(i,2)+2*n))- u1(3)) ...
       + abs(0.5*(sol(T(i,2)+2*n)+ sol(T(i,3)+2*n))- u2(3))...
       + abs(0.5*(sol(T(i,1)+2*n)+ sol(T(i,3)+2*n))- u3(3)));
    end
end

