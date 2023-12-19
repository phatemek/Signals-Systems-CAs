clc;
clearvars;
close all;

fs = 50;
N = 100;
t = -1 : 1/fs : 1 - 1/fs;
f = -fs/2 : fs/N : fs/2 - fs/N;
x = cos(10 * pi .* t);
Fx = fftshift(fft(x));
figure;
subplot(1, 2, 1);
plot(t, x);
title('x1');
subplot(1, 2, 2);
plot(f, abs(Fx)/max(abs(Fx)));
title('x1 fourier transform')