function [ f ] = P12func( u )
% Konvertiert ein Funktionswertearray in eine auswertbare Funktion mit
% lineaerer Interpolation. auf dem Interval (0,1)

f = @(x)linInter(u,x);

end

function [y] = linInter(u,x)
    u = u(:);
    n = length(u)-1;
    h = 1/n;
    i = floor(x/h)+1;
    m = mod(x,h);
    %Konstant fortsetzen
    i = min(n,max(1,i));
    y = (1-m./h).*u(i)+(m./h).*u(i+1);
end
