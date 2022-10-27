clear;close all;
r1 = 0.5;
r2 = 0.5;
theta1_eq = 8/32*pi;
theta2_eq = 3/4*pi;
sd = 1/32*pi;
N = 50;
plot_range = [-0.5 1];
% create uncorrelated noise
dtheta1 = sd*randn(N,1);
dtheta2 = sd*randn(N,1);
% uncorrelated case
theta1 = theta1_eq + dtheta1;
theta2_uncorr = theta2_eq + dtheta2;
figure;
subplot(1,3,1)
xend_uncorr = arrayfun(@(i)reaching_plot(r1,r2,theta1(i),theta2_uncorr(i)),...
    1:N,'unif',0)
xend_uncorr = cat(1,xend_uncorr{:});
title('Uncorrelated case')
set(gca,'xlim',plot_range,'ylim',plot_range);

% correlated - synergetic case
c = 0.9;
dtheta2_syn = -c*dtheta1 + sqrt(1-c^2)*dtheta2;
theta2_syn = theta2_eq + dtheta2_syn;
subplot(1,3,2)
xend_syn = arrayfun(@(i)reaching_plot(r1,r2,theta1(i),theta2_syn(i)),...
    1:N,'unif',0);
xend_syn = cat(1,xend_syn{:});
title('Synergetic case')
set(gca,'xlim',plot_range,'ylim',plot_range);
% correlated - non-synergetic case
dtheta2_nonsyn = c*dtheta1 + sqrt(1-c^2)*dtheta2;
theta2_nonsyn = theta2_eq + dtheta2_nonsyn;
subplot(1,3,3)
xend_nonsyn =arrayfun(@(i)reaching_plot(r1,r2,theta1(i),theta2_nonsyn(i)),...
    1:N,'unif',0)
xend_nonsyn = cat(1,xend_nonsyn{:});
title('Non-synergetic case')
set(gca,'xlim',plot_range,'ylim',plot_range);
