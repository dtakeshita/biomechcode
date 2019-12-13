clear; close all;
n_sample_set = [10 100 1000 10000];%number of measurements
n_ens = 5000;%number of ensembles 
sigma2 = 1;%variance of the population (normally distributed)
n_set = length(n_sample_set);
sem = zeros(1,n_set);
mean_ens = cell(1,n_set);
for ns = 1:n_set
    n_sample = n_sample_set(ns);
    rnd_num = sqrt(sigma2)*randn(n_sample,n_ens);
    mean_ens{ns} = mean(rnd_num,1);
    sem(ns) = std(mean_ens{ns});
end
%% draw histograms
figure;
for ns=1:n_set
    subplot(2,2,ns)
    histogram(mean_ens{ns})
end
%% plot SEMs
figure;
set(gcf,'position',[50 50 600 300]);%change position and size
%% plot with linear scale
subplot(1,2,1)
n_plot = logspace(log10(n_sample_set(1)), log10(n_sample_set(end)),1000);
plot(n_sample_set, sem,'o')
hold on 
plot(n_plot, sqrt(sigma2)./sqrt(n_plot),'-')
title('Linear scale')
xlabel('N');ylabel('SEM')
%% log-log plot
subplot(1,2,2)
loglog(n_sample_set, sem,'o')
hold on
loglog(n_sample_set, sqrt(sigma2)./sqrt(n_sample_set))
title('Log-Log scale')
xlabel('N');ylabel('SEM')