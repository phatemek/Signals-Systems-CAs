clc;
ro = zeros(size(t));
test_signal = zeros(size(t));
test_signal(1:N) = 1;
ro = conv(recieved_signal, test_signal);
ro = ro(1:length(t));

figure;
plot(t, ro, 'LineWidth', 4, 'Color', 'r')
xlim([0 1e-5])
ylabel('amplitude')
xlabel('time')
title('dot product')
grid on


[pks, locs] = findpeaks(abs(ro));
locs(1) = locs(1) - N;
td_found = t(locs(1));
R_found = td_found * c / 2