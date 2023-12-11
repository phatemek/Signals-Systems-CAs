clc;
clearvars;
ts = 1e-9;
T = 1e-5;
tau = 1e-6;
t = 0:ts:T;
sent_signal = zeros(1, length(t));
N = round(tau * length(t) / T);
sent_signal(1:N) = ones(1,N);

figure;
plot(t, sent_signal, 'LineWidth', 4)
ylim([-1 2])
xlim([0 1e-5])
ylabel('amplitude')
xlabel('time')
title('sent signal')
grid on