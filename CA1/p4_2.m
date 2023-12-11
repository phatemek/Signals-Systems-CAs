% sound(x, fs);
time_len = (length(x)-1)/fs;
t = 0:1/fs:time_len;

figure;
red = [0.8, 0.2, 0.2];
plot(t, x, 'Color', red);
title('Hafez audio');
xlabel('time');
ylabel('amplitude')
grid on

audiowrite('x.wav', x, fs);