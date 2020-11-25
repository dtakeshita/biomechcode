function dxdt = HHmodel_WG(t,x,I_t,I_ext)
    %x = [V m h n]
    E_Na = 55; E_K = -77; E_L = -65;
    g_Na = 40; g_K = 35; g_L = 0.3;
    I_Na = g_Na*x(2)^3*x(3)*(x(1)-E_Na);
    I_K = g_K*x(4)^4*(x(1)-E_K);
    I_L = g_L*(x(1)-E_L);
    I = interp1(I_t,I_ext,t);
    dVdt = I-I_Na-I_K-I_L;
    dmdt = alpha_m(x(1))*(1-x(2))-beta_m(x(1))*x(2);
    dhdt = alpha_h(x(1))*(1-x(3))-beta_h(x(1))*x(3);
    dndt = alpha_n(x(1))*(1-x(4))-beta_n(x(1))*x(4);
    dxdt = [dVdt; dmdt; dhdt; dndt];
end

function alpha = alpha_m(V)
    alpha = 0.182*(V+35)/(1-exp(-(V+35)/9));
end

function beta = beta_m(V)
    beta = -0.124*(V+35)/(1-exp((V+35)/9));
end

function alpha = alpha_h(V)
    alpha = 0.25*exp(-(V+90)/12);
end

function beta = beta_h(V)
    beta = 0.25*exp((V+62)/6)/exp((V+90)/12);
end

function alpha = alpha_n(V)
    alpha = 0.02*(V-25)/(1-exp(-(V-25)/9));
end

function beta = beta_n(V)
    beta = -0.002*(V-25)/(1-exp((V-25)/9));
end


