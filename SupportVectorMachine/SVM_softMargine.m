clear;
close all;
%% create test data
N = 20;
rng(1);%fix seed
X1 = rand(N*10,2);
delta = 0.05;
keep = sum(X1,2) < 1-delta;
keep2 = sum(X1,2) > 1+delta;
X2 = X1(keep2,:);
X1 = X1(keep,:);
X1 = X1(1:N,:);
X2 = X2(1:N,:);
Y1 = repmat({'1'},N,1);
Y2 = repmat({'2'},N,1);
% create non linear-separability
idx_2to1 = [19];
%Y2(idx_2to1) = {'1'};
X1_tmp = X2(idx_2to1,:);
X2(idx_2to1,:)=[];
X1 = [X1;X1_tmp];

idx_1to2 = [16];
% Y1(idx_change) = {'2'};
X2_tmp = X1(idx_1to2,:);
X1(idx_1to2,:)=[];
X2 = [X2;X2_tmp];


X = [X1;X2];
Y = [Y1;Y2];

%% SVM
boxConstraint = 100;
mdl = fitcsvm(X,Y,'BoxConstraint',boxConstraint);% soft margin
%% classify grid for checking purpose
x = linspace(0,1);
y = linspace(0,1);
[XX,YY] = meshgrid(x,y);
pred = [XX(:),YY(:)];
p = predict(mdl,pred);
%% get support vectors
svInd = mdl.IsSupportVector;
%% get the decision boundary
f = @(x) -(x*mdl.Beta(1) + mdl.Bias)/mdl.Beta(2);
x_bdry = -0.2:0.1:1.2;
y_bdry = f(x_bdry);
%% get margin??
mb = @(x,x0,y0) -mdl.Beta(1)/mdl.Beta(2)*(x - x0) + y0; 
Xsv = X(svInd,:);
Nsv = size(Xsv,1);
y_margin = arrayfun(@(i)mb(x_bdry, Xsv(i,1), Xsv(i,2)),1:Nsv,'unif',0);

%% plot
clr = 0.8*[1 1 1];
mkr_sz = 10;
h1 = plot(X1(:,1),X1(:,2),'o');
hold on 
h2 = plot(X2(:,1),X2(:,2),'ko');
set(h1,'markersize',mkr_sz,'markerEdgeColor','k','markerFaceColor',clr)
set(h2,'MarkerFaceColor','k','markerEdgeColor','k','markersize',mkr_sz)
%plot(X(svInd,1),X(svInd,2),'ko','MarkerSize',16)
plot(x_bdry,y_bdry,'k')
%cellfun(@(y)plot(x_bdry,y,'k--'),y_margin)
set(gca,'xlim',[-0.1 1.1],'ylim',[-0.1 1.1],...
    'xtick',[],'ytick',[],'fontsize',18)
axis square
str_ttl = sprintf('BoxConstraint=%g',boxConstraint)
title(str_ttl)
%gscatter(pred(:,1),pred(:,2),p);