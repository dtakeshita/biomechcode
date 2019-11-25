clear;
close all;
tspan = [0 20];
y0 = 10;
f = @(t,y) -2*y;
[t,y] = ode45(f, tspan, y0);
plot(t,y)