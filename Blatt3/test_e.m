%Nils Dreier und Marlon Röben
%Testen des Programms wie in Aufgabenteil (e) zu nichttrivialen
%Dirichletrandwerten

%Anlegen des Grids
[C, T, b] = createGrid(50);
%RHS, berechnet aus der exakten Lösung
f = @(x,y)4*pi.^2.*x.*sin(2*pi.*y);
%Exakte Lösung
u_exact = @(x,y)x.*sin(2*pi*y);
%Anlegend der Randwerte
u_d = zeros(size(b));
u_d(b~=0) = u_exact(C(b~=0,1),C(b~=0,2));
%Berechnung der numerischen Lösung
u = FE_P1(C,T,b,f,u_d);
%Visualisierung der Lösung
trisurf(T,C(:,1),C(:,2),u);
figure
%Berechnnung des Fehlers
e = calcError(u_exact,u,T,C);
CX = C(:,1);
CY = C(:,2);
%Visualisierung des Fehlers
patch(CX(T'),CY(T'),e);