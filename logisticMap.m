clear;
close all;
N = 1000;
x = zeros(N,1);
for a = 2.5:0.01:4
    x(1) = 0.5;
    for n=2:N
        x(n) = a*x(n-1)*(1-x(n-1));
    end
    plot(a,x(900:end),'b.')
    hold on
end