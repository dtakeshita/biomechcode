clear;
close all;
lambda = 3;
x = 0:10;
y = poisspdf(x,lambda);
h = stem(x,y);
set(h,'linewidth',2)
set(gca,'xlim',[-0.5 7.5],'fontsize',20);

ndat = 50000;
sigma = 0.03;
m = 1;
n = poissrnd(lambda,[ndat 1]);
s = sqrt(n*sigma).*randn(ndat,1)+m*n;
figure;
h_histo = histogram(s,'normalization','pdf');
set(gca,'xlim',[-0.5 7.5],'fontsize',20);

