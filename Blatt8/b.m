e = 1e-2;
h = 1e-2;

u = Upwind(e,h);
figure;
plot(0:h:1,u);
title('Upwind');

u = Galerkin(e,h);
figure;
plot(0:h:1,u);
title('Galerkin');