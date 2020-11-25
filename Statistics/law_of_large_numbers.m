%generation of random numbers

%% normal distribution
clear
close all
N = 100000;
mu = 50;%mean
sigma = 10;%standard deviation
%% initialization
mu_set = zeros(3,1);
var_set = mu_set; 
%% single variable
x = mu + sigma*randn(N,1);
m(1) = mean(x)
v(1) = var(x)
%% Average of 10 samples
n_ave = 10;%number of averages
y = mu + sigma*randn(N,n_ave);
y_ave = mean(y,2);
m(2) = mean(y_ave);
v(2) = var(y_ave);
%% Average of 100 samples
n_ave = 100;%number of averages
y = mu + sigma*randn(N,n_ave);
y_ave2 = mean(y,2);
m(3) = mean(y_ave2);
v(3) = var(y_ave2);
%% draw probablity density functions
figure
lw = 2;
h = histogram(x,'Normalization','pdf', 'DisplayStyle', 'stairs', 'linewidth',lw);
hold on
h2 = histogram(y_ave,'Normalization','pdf', 'DisplayStyle', 'stairs', 'linewidth',lw);
h3 = histogram(y_ave2,'Normalization','pdf', 'DisplayStyle', 'stairs', 'linewidth',lw);
xlabel('Value'); ylabel('Probability density');
legend([h h2 h3], {'No average','10 averages', '100 averages'})
%% plot the standard deviation as a function of number of averages
figure
subplot(1,2,1)
n_ave = [1 10 100];%number of averages
sd = sqrt(v);%standard deviation
x_vec = 1:0.1:100;
sd_theory = sigma./sqrt(x_vec);

plot(n_ave,sd,'o')%linear scale
hold on
plot(x_vec, sd_theory,'r')
title('Linear scale')
xlabel('Number of averages');ylabel('Standard deviation')
set(gca,'fontsize',18)
subplot(1,2,2)
loglog(n_ave,sd)
set(gca,'ylim',[1 100],'fontsize',18)
title('Log scale')
xlabel('Number of averages');ylabel('Standard deviation')







