clear; 
close all;
y0 = 10;
%% solving ODE with the Euler method
h = 0.5;
N = 100;%number of simulated time steps
t = h*[0:N-1];%for plotting
y = zeros(N,1);%allocate memory
y(1) = y0;%setting an initial value
for n=2:N
    y(n) = y(n-1) + h*(-y(n-1));
end
%% solving ODE with the Euler method
h = 0.01;
N = 1000;%number of simulated time steps
t1 = h*[0:N-1];
y1 = zeros(N,1);%allocate memory
y1(1) = y0;%setting an initial value
for n=1:N-1
    y1(n+1) = y1(n) + h*(-y1(n));
end
%% plot the solution
y_analy = y0*exp(-t); 
h = plot(t,y);
hold on
h1 = plot(t1,y1);
ha = plot(t,y_analy,'o');
set(h,'linewidth',2,'color','b')
set(h1,'linewidth',2,'color','k')
set(ha,'markerfacecolor',[1 0 0])
legend({'h=0.1','h=0.01','analytical'})
set(gca,'xlim',[0 4])