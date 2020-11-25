clear; close all;
V = -50:50;
alpha_m = 0.1*(25-V)./(exp((25-V)/10)-1);
beta_m = 4*exp(-V/18);
m_inf = alpha_m./(alpha_m+beta_m);

plot(V, alpha_m)
xlabel('V'); ylabel('\alpha_m')
figure;
plot(V, beta_m)
figure;
plot(V, m_inf)
