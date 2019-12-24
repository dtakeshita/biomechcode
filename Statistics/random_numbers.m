%generation of random numbers

%% uniform distribution
clear
close all
x = rand(10,1);%a vector of random numbers from uniform distribution [0,1]
y = rand(3);%a matrix of random numbers from uniform distribution
z1 = rand(10000,1);
z2 = rand(10000,1);
z3 = rand(10000,1);
z4 = rand(10000,1);
z5 = z1 + z2;
z6 = z1 + z2 + z3;
z7 = z1 + z2 + z3 + z4;
mean(z1) %(b-a)/2
var(z1) %1/12*(b-a)^2
subplot(2,2,1)
histogram(z1)%draw a histogram
title('random variable with uniform distribution')
subplot(2,2,2)
histogram(z5)
title('sum of two random variables with uniform distribution')
subplot(2,2,3)
histogram(z6)
title('sum of three random variables with uniform distribution')
subplot(2,2,4)
histogram(z7)
title('sum of three random variables with uniform distribution')

%% Nomral distribution (Gaussian distribution)
v = randn(10000,1);%Standard normal distribution (mean:0, standard distribution 1)
w = randn(10000,1);
figure;
histogram(v)
