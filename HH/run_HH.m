clear; close all;
tspan = [0 200];%time interval 
x0 = [-65;0;0;0];%initial condition
I_t = 0:0.01:tspan(end);
I_ext = 5*ones(size(I_t));
f = @(t, x)HHmodel_WG(t,x,I_t,I_ext);
[t,y] = ode45(f, tspan, x0);
%% plot
subplot(4,1,1)
plot(t,y(:,1))
subplot(4,1,2)
plot(t,y(:,2))
subplot(4,1,3)
plot(t,y(:,3))
subplot(4,1,4)
plot(t,y(:,4))