clear; close;
dydt = @(a)(@(y)a*y);
a = -20;
y0 = 1;
tspan = [0 0.5];
h = 1/16;
[t, y] = my_heun(dydt(a), tspan, y0, h);
[t_euler, y_euler] = my_euler(dydt(a), tspan, y0, h);
[t_RK, y_RK] = my_RK4(dydt(a), tspan, y0, h);
%f = @(y)-20*y;
%[t_RK, y_RK] = ode45(@(t,y)-20*y, tspan, [1]);
%% analytical solution
t_analy = tspan(1):1e-4:tspan(2);
y_analy = y0*exp(a*t_analy);
%% plot
plot(t,y,'kx')
hold on
plot(t_euler, y_euler,'r')
plot(t_RK, y_RK,'mx')
plot(t_analy,y_analy,'b')
legend({'Heun','Euler','RK','Analytical'})
