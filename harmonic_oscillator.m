function dxdt = harmonic_oscillator(t,x,m,k)
    M = [0 1;-k/m 0];
    dxdt = M*x;
end