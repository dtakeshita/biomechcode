clear; close;
%% use my_euler.m
dydt = @(a)(@(y)a*y);
a = -20;
y0 = 10;
tspan = [0 4];
h = 0.01;
[y, t] = my_heun(dydt(a), tspan, y0, h);
%% analytical solution
t_analy = tspan(1):1e-4:tspan(2);
y_analy = y0*exp(a*t_analy);
%% plot
plot(t,y)
hold on
plot(t_analy,y_analy)

