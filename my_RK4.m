function [t, y] = my_RK4(dydt, tspan, y0, h)
    t = tspan(1):h:tspan(2);
    y = zeros(size(t));
    y(1) = y0;
    for i=1:(length(t)-1)                              % calculation loop
        k_1 = dydt(y(i));
        k_2 = dydt(y(i)+0.5*h*k_1);
        k_3 = dydt((y(i)+0.5*h*k_2));
        k_4 = dydt((y(i)+k_3*h));
        y(i+1) = y(i) + (1/6)*(k_1+2*k_2+2*k_3+k_4)*h;  % main equation
    end