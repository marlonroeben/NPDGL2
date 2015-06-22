delta = 1e-3;

u = Streamline(e,h,delta);
figure;
plot(0:h:1,u);
title('Streamline');