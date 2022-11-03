clear;
close all;
tic 
N = 1000;
a_vec = 2.5:0.01:4;
n_a = length(a_vec);
x = zeros(N,n_a);
for m = 1:n_a
    x(1) = 0.5;
    a = a_vec(m);
    for n=2:N
        x(n,m) = a*x(n-1)*(1-x(n-1));
    end

%     plot(a,x(900:end),'b.')
%     hold on
end
toc
figure
hold on
for n=1:n_a
    plot(a_vec(n),x(end-100:end,n),'b.')
end