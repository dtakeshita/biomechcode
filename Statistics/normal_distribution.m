% demonstration of normal distribution
clear
close all
r = randn(50000,1);
%% standard nomral distribution
x = -4:0.01:4;
mu = 0;%mean
sigma = 1;%standard deviation
y = normpdf(x,mu,sigma);
%% compare histogram and pdf
histogram(r,'Normalization','pdf')
hold on
plot(x,y,'color','r','linewidth',2)