clear; close all;
tspan = [0 20];%time interval 
x0 = [1;0];%initial condition
m = 1; k = 1;
f = @(t, x)harmonic_oscillator(t,x,m,k);
[t,y] = ode45(f, tspan, x0);
%% plot position and velocity
figure;
subplot(1,2,1)
plot(t,y(:,1))
hold on
plot(t,y(:,2))
legend({'Position','Velocity'})
xlabel('Time (sec)');ylabel('Position or velocity')
%% plot Lissajous curve
subplot(1,2,2)
plot(y(:,1),y(:,2))
xlabel('X');ylabel('V');