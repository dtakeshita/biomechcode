% demonstration of the central limit theorem
N = 1000;
w = rand(N);
mu = 0.5;
sigma2 = 1/12;%1/12*(b-a)^2
w_sum = (sum(w,1)-mu*N)/sqrt(N*sigma2);%mean:0, std:1

figure;
subplot(2,2,1)
histogram(w,'normalization','pdf')
subplot(2,2,2)
histogram(w_sum,'normalization','pdf')