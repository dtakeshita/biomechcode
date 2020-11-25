function dxdt = HHmodel(t,x,I_t,I_ext)
    %x = [V m h n]
    E_Na = 55; E_K = -77; E_L = -54;
    g_Na = 120; g_K = 36; g_L = 0.3;
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
    alpha = 0.1*(25-V)/(exp((25-V)/10)-1);
end

function beta = beta_m(V)
    beta = 4*exp(-V/18);
end

function alpha = alpha_h(V)
    alpha = 0.07*exp(-V/20);
end

function beta = beta_h(V)
    beta = 1/(exp((30-V)/10)+1);
end

function alpha = alpha_n(V)
    alpha = 0.01*(10-V)/(exp((10-V)/10)-1);
end

function beta = beta_n(V)
    beta = 0.125*exp(-V/80);
end


