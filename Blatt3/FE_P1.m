%Marlon Röben und Nils Dreier
function [ u ] = FE_P1( C,T,boundary,f,u_d )

n = size(C,1); % Knotenanzahl
A = zeros(n); % Steifigkeitsmatrix initialisieren
b = zeros(n,1); %Rechte Seite initialisieren
% Gridwalk, Steifigkeitsmatrix und rechte Seite assemblieren
for i = 1:size(T,1);
    E = T(i,:);
    A(E,E) = A(E,E)+localA(C(E,:));
    b(E) = b(E)+localb(C(E,:),f);
end

%Boundarywalk, Steifigkeitsmatrix und rechte Seite ändern um Randwerte
%festzulegen
for i = find(boundary)'
   A(i,:) = 0;
   A(i,i) = 1;
   b(i) = u_d(i);
end

%lösen
u = A\b;
end

%berechnet die Transformation vom Referenzelement in das Dreieck, das
%durch die Ecken in C festgelegt wird
function [T] = getTransformation(C)
    theta = atan2(C(3,2)-C(1,2),C(3,1)-C(1,1)); % Winkel um den gedreht wird
    T = [cos(theta) -sin(theta); sin(theta) cos(theta)]; % Rotationsmatrix erstellen
    dx = norm(C(1,:)-C(2,:)); % Skalierung bestimmen
    T = dx*T; % Skalierung
end

% berechnet die Determinante der Jacobimatrix der Transformation
function [d] = getTransDet(C)
    d = norm(C(1,:)-C(2,:)).^2;
end

% Lokale Steifigkeitsmatrix assemblieren
function [A] = localA(C)
%Steifigkeitsmtrix für Referenzelemente
A = zeros(3);
A(1,1) = 1;
A(1,2) = -0.5;
A(1,3) = -0.5;
A(2,1) = A(1,2);
A(2,2) = 0.5;
A(2,3) = 0;
A(3,1) = A(1,3);
A(3,2) = A(2,3);
A(3,3) = 0.5;

A = A.*getTransDet(C); % Transformation (alle anderen Transformationen löschen sich gegenseitig, aufgrund der Gittergeometrie)
end

% lokale rechte Seite assemblieren
function [b] = localb(C,f)
    b = zeros(3,1);
    T = getTransformation(C);
    phi1 = @(x)1-x(1)-x(2); % erste Basisfunktion
    f1 = @(x,y) f(x,y)*(phi1(T*[x;y])); % Transformierte Basisfunktion mal f
    b(1) = trapez(C,f1); % Integralbestimmen
    
    phi2 = @(x)x(1);
    f2 = @(x,y) f(x,y)*(phi2(T*[x;y]));
    b(2) = trapez(C,f2);
    
    phi3 = @(x)x(2);
    f3 = @(x,y) f(x,y)*(phi3(T*[x;y]));
    b(3) = trapez(C,f3);
    
    b = b.*getTransDet(C); % Faktor für Transformation
end


%Trapezregel zur bestimmung eines Integrals
function [I] = trapez(E,f)
I = f(0.5*(E(1,1)+E(2,1)),0.5*(E(1,2)+E(2,2)));
I = I+f(0.5*(E(2,1)+E(3,1)),0.5*(E(2,2)+E(3,2)));
I = I+f(0.5*(E(3,1)+E(1,1)),0.5*(E(3,2)+E(1,2)));
I = I/3;

Vol = (E(1,1)-E(2,1))^2/2;
I = I * Vol;

end