function [t, y] = my_euler(dydt, tspan, y0, h)
    t = tspan(1):h:tspan(2);
    y = zeros(size(t));
    y(1) = y0;
    for n=1:length(t)-1
        y(n+1) = y(n) + h*dydt(y(n));
    end
end