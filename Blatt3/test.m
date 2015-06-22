%Nils Dreier und Marlon Röben
%Testet das Programm wie in Aufgabenteil (d)
%Anlegen eines Grids mit 50x50*2 Dreiecken auf (0,1)x(0,1) 
[C, T, b] = createGrid(50);
%RHS
f = @(x,y)-20*(y*(y-1)+x*(x-1));
%Numerische Lösung des Poissonproblems mit homogenen Randwerten
u = FE_P1(C,T,b,f,zeros(size(b)));
%Visualisierung der Lösung
trisurf(T,C(:,1),C(:,2),u);
figure
%Exakte Lösung
u_exact = @(x,y)10*x*(1-x)*y*(1-y);
e = calcError(u_exact,u,T,C);
CX = C(:,1);
CY = C(:,2);
%Visualisierung des Fehlers
patch(CX(T'),CY(T'),e);