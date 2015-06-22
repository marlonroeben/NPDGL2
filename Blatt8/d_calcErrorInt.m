function [ e_G, e_U, e_S ] = d_calcErrorInt( e,h )

[g, u, s] = d_calcError(e,h);
e_G = GaussQuadrature5(P12func(g));
e_U = GaussQuadrature5(P12func(u));
e_S = GaussQuadrature5(P12func(s));
end


function [ e_G, e_U, e_S ] = d_calcError( h, e )
x = 0:h:1;
ex = exact(x',e);
u_G = Galerkin(e,h);
u_U = Upwind(e,h);
u_S = Streamline(e,h);

e_G = abs(ex-u_G);
e_U = abs(ex-u_U);
e_S = abs(ex-u_S);

end

