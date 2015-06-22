%Nils Dreier und Marlon Röben
function [ e ] = calcError( u_exact, u_num, T,C )
%Berechnet den Fehler von u_num zur exakten Lösung u_exact
e = zeros(size(T,1),1);
%Gridwalk
for i = 1:size(T,1)
   E = T(i,:);
   e(i) = trapez(C(E,:),u_exact,u_num(E));
end

end
%Trapezregel zur Integration auf dem Dreieck E von |u_exact-u_num|
function [I] = trapez(E,ex, num)
I = abs(ex(0.5*(E(1,1)+E(2,1)),0.5*(E(1,2)+E(2,2)))-0.5*(num(1)+num(2)));
I = I+abs(ex(0.5*(E(2,1)+E(3,1)),0.5*(E(2,2)+E(3,2)))-0.5*(num(2)+num(3)));
I = I+abs(ex(0.5*(E(3,1)+E(1,1)),0.5*(E(3,2)+E(1,2)))-0.5*(num(3)+num(1)));
I = I/3;

Vol = (E(1,1)-E(2,1))^2/2;
I = I * Vol;

end