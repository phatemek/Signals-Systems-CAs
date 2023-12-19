clc;
clearvars;
close all;

fs = 20;
ts = 1/fs;
t = 0 : ts : 1 - ts;
N = 20;
f = -fs/2 : fs/N : fs/2 - fs/N;
x1 = exp(j * 2 * pi * 5 .* t) + exp(j * 2 * pi * 8 .* t);
x2 = exp(j * 2 * pi * 5 .* t) + exp(j * 2 * pi * 5.1 .* t);
Fx1 = fftshift(fft(x1));
Fx2 = fftshift(fft(x2));
figure;
subplot(1, 2, 1);
plot(f, Fx1);
title('x1 fourier transform')
subplot(1, 2, 2);
plot(f, Fx2);
title('x2 fourier transform')