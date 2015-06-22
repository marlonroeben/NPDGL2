function [ I ] = GaussQuadrature5( f )

%Transform with x |-> 0.5x+0.5
f_trans = @(x)0.5*f(0.5*x+0.5);
I = GaussQuadrature5Ref(f_trans);
end

function [ I ] = GaussQuadrature5Ref(f)
    x = zeros(5,1);
    a = x;
    x(5) = sqrt(5+2*sqrt(10/7))/3;
    x(1) = -x(5);
    x(4) = sqrt(5-2*sqrt(10/7))/3;
    x(2) = -x(4);
    x(3) = 0;
    a(1) = (322-13*sqrt(70))/900;
    a(5) = a(1);
    a(2) = (322+13*sqrt(70))/900;
    a(4) = a(2);
    a(3) = 128/225;
    I = sum(a.*f(x));
end