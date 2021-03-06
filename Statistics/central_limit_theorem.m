% demonstration of the central limit theorem
clear; close all;
n_sum = 10;
n_sample = 5000;
w = rand(n_sum,n_sample);%uniform distribution from [0 1]
mu = 0.5;%mean of the uniform distribution
sigma2 = 1/12;%1/12*(b-a)^2
w_sum1 = sum(w,1);%just summed
w_sum2 = sum(w,1)-mu*n_sum;%mean 0
w_sum3 = (sum(w,1)-mu*n_sum)/sqrt(n_sum*sigma2);%mean:0, std:1
% create the standard normal distribution
x=-3:0.01:3;
y_normal = normpdf(x);

figure;
subplot(2,2,1)
histogram(w,'normalization','pdf')
xlabel('x');ylabel('Probability density')
subplot(2,2,2)
histogram(w_sum1,'normalization','pdf')
title(['Summed ',num2str(n_sum),' times'])
xlabel('x');ylabel('Probability density')
subplot(2,2,3)
histogram(w_sum2,'normalization','pdf')
title(['Summed ',num2str(n_sum),' times and mean subtracted'])
xlabel('x');ylabel('Probability density')
subplot(2,2,4)
histogram(w_sum3,'normalization','pdf')
hold on 
h = plot(x,y_normal,'r-')
title({['Summed ',num2str(n_sum),' times,']; 'mean subtracted and SD normalized'})
xlabel('x');ylabel('Probability density')
set(h,'linewidth',2)