%transformation of random numbers
close all
v = randn(10000,1);%Standard normal distribution (mean:0, standard distribution 1)
w = randn(10000,1);
% transformation of random variables
a = v + 2;
b = 3*v;%var(b) = 2^2*var(v)
c = v + w;
d = w + b;%var(d) = var(w) + var(b) if they are statistically independent
e = v + b;%does this follow the formula above?
% calculate the statistics below:
m_v = mean(v);
m_a = mean(a);
m_c = mean(c);
m_e = mean(e);
v_v = var(v);
v_a = var(a);
v_c = var(c);
v_e = var(e);

%plot hitograms
subplot(2,4,1)
histogram(v,'normalization','pdf')
xlabel('x');ylabel('Probability density')
str_ttl = {'v'; sprintf('var(v)=%.3g',var(v));...
            sprintf('mean(v)=%.3g',mean(v))};
title(str_ttl)
subplot(2,4,2)
histogram(w,'normalization','pdf')
xlabel('x');ylabel('Probability density')
str_ttl = {'w'; sprintf('var(w)=%.3g',var(w));...
            sprintf('mean(w)=%.3g',mean(w))};
title(str_ttl)
subplot(2,4,3)
histogram(a,'normalization','pdf')
xlabel('x');ylabel('Probability density')
str_ttl = {'a=v+2'; sprintf('var(a)=%.3g',var(a));...
            sprintf('mean(a)=%.3g',mean(a))};
title(str_ttl)

subplot(2,4,4)
histogram(b,'normalization','pdf')
xlabel('x');ylabel('Probability density')
str_ttl = {'b=2*v'; sprintf('var(b)=%.3g',var(b));...
            sprintf('mean(b)=%.3g',mean(b))};
title(str_ttl)

subplot(2,4,5)
histogram(c,'normalization','pdf')
xlabel('x');ylabel('Probability density')
str_ttl = {'c=v+w'; sprintf('var(c)=%.3g',var(c));...
            sprintf('mean(c)=%.3g',mean(c))};
title(str_ttl)
subplot(2,4,6)
histogram(d,'normalization','pdf')
xlabel('x');ylabel('Probability density')
str_ttl = {'d=w+b'; sprintf('var(d)=%.3g',var(d));...
            sprintf('mean(d)=%.3g',mean(d))};
title(str_ttl)

subplot(2,4,7)
histogram(e,'normalization','pdf')
xlabel('x');ylabel('Probability density')
str_ttl = {'e=v+b'; sprintf('var(d)=%.3g',var(e));...
            sprintf('mean(d)=%.3g',mean(e))};
title(str_ttl)


ah_all = findobj(gcf,'type','axes');
set(ah_all,'xlim',[-15 15],'ylim',[0 0.5])





