clear;
close all;
%% create test data
N = 100;
rng(1);%fix seed
alpha = 0.9;
R1 = rand(N,1)*alpha;
R2 = rand(N,1)+1+(1-alpha);
theta1 = 2*pi*rand(N,1);
theta2 = 2*pi*rand(N,1);
X1 = [R1.*cos(theta1) R1.*sin(theta1)];
X2 = [R2.*cos(theta2) R2.*sin(theta2)];
Y1 = repmat({'1'},N,1);
Y2 = repmat({'2'},N,1);
X = [X1;X2];
Y = [Y1;Y2];
%% SVM
mdl = fitcsvm(X,Y,'BoxConstraint',Inf,'KernelFunction','rbf');% hard margin
% Predict scores over the grid
d = 0.02;
[x1Grid,x2Grid] = meshgrid(min(X(:,1)):d:max(X(:,1)),...
    min(X(:,2)):d:max(X(:,2)));
xGrid = [x1Grid(:),x2Grid(:)];
[~,scores] = predict(mdl,xGrid);
%% plot
clr = 0.8*[1 1 1];
mkr_sz = 10;
h1 = plot(X1(:,1),X1(:,2),'o');
hold on 
h2 = plot(X2(:,1),X2(:,2),'o');
set(h1,'markersize',mkr_sz,'markerEdgeColor','k','markerFaceColor',clr)
set(h2,'MarkerFaceColor','k','markerEdgeColor','k','markersize',mkr_sz)
hc = contour(x1Grid,x2Grid,reshape(scores(:,2),size(x1Grid)),[0 0],'k');
axis square
set(gca,'xlim',[-2.2 2.2],'ylim',[-2.2 2.2],...
     'xtick',[],'ytick',[],'fontsize',18)