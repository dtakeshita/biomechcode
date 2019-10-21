%% under construction
clear; 
close all;
h_set = logspace(-5,-2,10);
dydt = @(y)-y;
y0 = 10;
tspan = [0 4];
y_last = zeros(size(h_set));
for n = 1:length(h_set)
    h = h_set(n);
    [y, t] = my_euler(dydt, tspan, y0, h); 
    y_last(n) = y(end);
end
err = abs(y_last - exp(-tspan(2)));
semilogy(h_set,err)

    