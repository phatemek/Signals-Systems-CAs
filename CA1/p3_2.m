recieved_signal = zeros(size(t));
R = 450;
c = 299792458;
td = 2 * R / c;
idx = round(td * length(t) / T);
recieved_signal(idx : idx + N) = 0.5;
figure;
plot(t, recieved_signal, 'LineWidth', 4)
ylim([-1 2])
xlim([0 1e-5])
ylabel('amplitude')
xlabel('time')
title('recieved signal')
grid on