u_0 = ones(4,1);
gamma = 4;
A = [0 10^gamma -1 0; 0 10^gamma 0 0; 1 -1 0 0; 0 0 0 1];

k = 0.05;
T = 100;
u = zeros(4,T/k+1);
u(:,1) = u_0;
ue = u_exact(0:k:T, gamma);

for i = 2:T/k+1
   u(:,i) = thetaVerf(A,k,1,u(:,i-1));
end

fehler1 = abs(u(1,:)-ue(1,:));
fehler3 = abs(u(3,:)-ue(3,:));
plot(0:k:T,[fehler1; fehler3]);
title('Fehler');
legend('Fehler 1', 'Fehler 2');

figure;
plot(0:k:T,[u(1,:); ue(1,:)]);
title('Erste Komponente');
legend('u_{num}', 'u_{exakt}');

figure;
plot(0:k:T,[u(3,:); ue(3,:)]);
title('Dritte Komponente');
legend('u_{num}', 'u_{exakt}');