clc;
clearvars;
close all;

fs = 100;
N = 100;
t = 0 : 1/fs : 1 - 1/fs;
f = -fs/2 : fs/N : fs/2 - fs/N;
x = cos(30 * pi .* t + pi/4);
Fx = fftshift(fft(x));
% figure;
% subplot(1, 2, 1);
% plot(t, x);
% title('x2');
% subplot(1, 2, 2);
% plot(f, abs(Fx)/max(abs(Fx)));
% title('x2 fourier transform')

tol = 1e-6;
Fx(abs(Fx) < tol) = 0;
theta = angle(Fx);
figure;
plot(f, theta/pi);
xlabel('Frequency (Hz)');
ylabel('Phase / \pi');
title('Phase');