clear; close all;
tspan = [0 20];
y0 = [1;0];
m = 1; k = 1;
f = @(t, x)harmonic_oscillator(t,x,m,k);
[t,y] = ode45(f, tspan, y0);
%% plot position and velocity
figure;
plot(t,y(:,1))
hold on
plot(t,y(:,2))
legend({'Position','Velocity'})
%% plot Lissajous curve
figure;
plot(y(:,1),y(:,2))