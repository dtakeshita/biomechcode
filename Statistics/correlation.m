clear; close all;
N = 10000;
x = 5*randn(N,1);
y = 5*randn(N,1);
% generate random numbers correlated with x and y
c = 0.5;
z = c*x + sqrt(1-c^2)*y;
%% calculate covariant matrix
C_xy = cov(x,y);
C_xz = cov(x,z);
C_yz = cov(y,z);
%% calculate covariance & correlation
[R_xy, p_xy] = corrcoef(x,y);
[R_xz, p_xz] = corrcoef(x,z);
[R_yz, p_yz] = corrcoef(y,z);
%% generate random numbers based on the covariance matrix
mu = [0 0];
w = mvnrnd(mu, C_xz, N);
R_w = corrcoef(w);

% plot data
% plot X & Y
subplot(2,2,1)
plot(x,y,'.')
xlabel('X');ylabel('Y');
str_ttl = {'X & Y';sprintf('R=%.2g',R_xy(1,2))};
title(str_ttl)
set(gca,'xlim',[-20 20],'ylim',[-20 20])
axis square
% plot X & Z
subplot(2,2,2)
plot(x,z,'.')
xlabel('X');ylabel('Z');
str_ttl = {'X & Z';sprintf('R=%.2g',R_xz(1,2))};
title(str_ttl)
set(gca,'xlim',[-20 20],'ylim',[-20 20])
axis square
% plot Y & Z
subplot(2,2,3)
plot(y,z,'.')
xlabel('Y');ylabel('Z');
str_ttl = {'Y & Z';sprintf('R=%.2g',R_yz(1,2))};
title(str_ttl)
set(gca,'xlim',[-20 20],'ylim',[-20 20])
axis square
% plot W(:,1) & W(:,2)
subplot(2,2,4)
plot(w(:,1),w(:,2),'.')
xlabel('W(:,1)');ylabel('W(:,2)');
str_ttl = {'W(:,1) & W(:,2)';sprintf('R=%.3g',R_w(1,2))};
title(str_ttl)
set(gca,'xlim',[-20 20],'ylim',[-20 20])
axis square
