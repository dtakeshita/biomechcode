clear;
close all;
tic 
N = 1000;
x = zeros(N,1);
figure;
hold on
for a = 2.5:0.01:4.0
    x(1) = 0.5;
    for n=2:N
        x(n) = a*x(n-1)*(1-x(n-1));
    end
    plot(a*ones(101,1),x(900:end),'b.')%faster
    %plot(a,x(900:end),'b.')%Slow - not recommended
end
toc
