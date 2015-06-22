A = gallery('poisson', 10);
b = ones(size(A,1),1);

disp('Gauss-Seidel:');
[x,i] = GausSeidel(A,b,ones(size(A,1),1),1e-10,1000);
disp([num2str(i), ' Iterationen' ]);

[x,i] = GausSeidel(A,b,ones(size(A,1),1),1e-14,1000);
disp([num2str(i), ' Iterationen' ]);

disp('DefektLöser:');
[x,i] = DefektLoeser(A,b,ones(size(A,1),1),1e-10,1000);
disp([num2str(i), ' Iterationen' ]);

[x,i] = DefektLoeser(A,b,ones(size(A,1),1),1e-14,1000);
disp([num2str(i), ' Iterationen' ]);

disp('SymGausSeidel:')
[x,i] = SymGausSeidel(A,b,ones(size(A,1),1),1e-10,1000);
disp([num2str(i), ' Iterationen' ]);

[x,i] = SymGausSeidel(A,b,ones(size(A,1),1),1e-14,1000);
disp([num2str(i), ' Iterationen' ]);

disp('SymGausSeidel Defekt:')
[x,i] = SymDefektLoeser(A,b,ones(size(A,1),1),1e-10,1000);
disp([num2str(i), ' Iterationen' ]);

[x,i] = SymDefektLoeser(A,b,ones(size(A,1),1),1e-14,1000);
disp([num2str(i), ' Iterationen' ]);

disp('CG:')
[x,f,r,i] = pcg(A,b,1e-14,1000,[]);
disp([num2str(i), ' Iterationen' ]);


M = @(x)SymDefektLoeser(A,x,zeros(size(x)),1e-14,1);
[x,f,r,i] = pcg(A,b,1e-14,1000,M);
disp([num2str(i), ' Iterationen' ]);
