%generation of random numbers

%% normal distribution
clear
close all
N = 100000;
mu = 5;%mean
sigma = 3;%standard deviation
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






