clc;
clearvars;
load('p2.mat')

% figure x:
figure;
plot(t, x, '--r')
title('X')
xlabel('time')
ylabel('amplitude')
grid on
