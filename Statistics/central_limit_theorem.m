% demonstration of the central limit theorem
N = 1000;
w = rand(N);
w_sum = sum(w,1);
figure;
subplot(2,2,1)
histogram(w,'normalization','pdf')
subplot(2,2,2)
histogram(w_sum/N,'normalization','pdf')