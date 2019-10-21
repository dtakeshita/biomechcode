function [t, y] = my_heun(dydt, tspan, y0, h)
    t = tspan(1):h:tspan(2);
    y = zeros(size(t));
    y(1) = y0;
    for n=1:length(t)-1
        k1 = dydt(y(n));
        k2 = dydt(y(n)+k1*h);
        y(n+1) = y(n) + h/2*(k1+k2);
    end
end