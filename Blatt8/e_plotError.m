function [  ] = e_plotError( e)
%E_PLOTERROR 

hArr = (0.5*ones(1,12)).^(1:12);
e_G = zeros(1,12);
e_U = zeros(1,12);
e_S = zeros(1,12);

i=1;
for h=hArr
    [e_G(i),e_U(i),e_S(i)] = d_calcErrorInt(e,h);
    i=i+1;
end

loglog(hArr, [e_G; e_U; e_S]);
legend('Galerkin','Upwind','Streamline');