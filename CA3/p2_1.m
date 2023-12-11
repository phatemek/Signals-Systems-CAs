clc;
clearvars;

fs = 8000;
Ts = 1/fs;
Ton = 0.1;
Toff = 0.1;
t = 0 : Ts : 8*(Ton + Toff);
result = zeros(length(t));
on_len = Ton * fs;
off_len = Toff * fs;
T = on_len + off_len;
result(1       :       on_len + 1) = build_sound(4);
result(T + 1   : 1*T + on_len + 1) = build_sound(3);
result(2*T + 1 : 2*T + on_len + 1) = build_sound(2);
result(3*T + 1 : 3*T + on_len + 1) = build_sound(1);
result(4*T + 1 : 4*T + on_len + 1) = build_sound(8);
result(5*T + 1 : 5*T + on_len + 1) = build_sound(7);
result(6*T + 1 : 6*T + on_len + 1) = build_sound(6);
result(7*T + 1 : 7*T + on_len + 1) = build_sound(5);
result = result(:, 1:2);
sound(result, fs)
% figure;
% plot(t, result);
% xlabel('time');
% ylabel('amplitude');
% title('43218765 signal');
file_name = 'y.wav';
audiowrite(file_name, result, fs);