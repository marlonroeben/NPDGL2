% Marlon Röben und Nils Dreier
function [ C, T, b ] = createGrid( N )
%Erstellt ein Dreiekcsgitter von (0,1)x(0,1) mit Kantenlänge 1/N

%Koordinatenmatrix initialisieren
C = zeros(N^2,2);
%Kantenlänge
dx = 1/N;


%Gridwalk für Koordinaten
k = 1;
for x = 0:dx:1
    for y = 0:dx:1
        C(k,1) = x;
        C(k,2) = y;
        k=k+1;
    end
end

%Gridwalk über Dreiecke
T = zeros(2*N^2,3);
k = 1;
for x = 1:N
   for y = 1:N
       j = (x-1)*(N+1)+y;
       T(k,1) = j+N+1;
       T(k,2) = j;
       T(k,3) = j+N+2;
       k = k+1;
       T(k,1) = j+1;
       T(k,2) = j+N+2;
       T(k,3) = j;
       k = k+1;
   end
end

% Boundary Vektor aufstellen
b = zeros((N+1)^2,1);
k=1;
for x = 1:N+1
    for y = 1:N+1
        if(x == 1 || y==1 || x==N+1 || y==N+1)
           b(k) = 1;
        end
        k=k+1;
    end
end

end

