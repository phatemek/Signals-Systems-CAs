clc;
clearvars;
close all;

%{
% test for y:
[y, fs] = audioread('y.wav');
Ts = 1/fs;
Ton = 0.1;
Toff = 0.1;
t = 0 : Ts : length(y)/fs - Ts;
on_len = Ton * fs;
off_len = Toff * fs;
T = on_len + off_len;
number = zeros(1, 8);

for i = 1 : 8
    key = y((i-1)*T+1 : (i-1)*T + on_len + 1);
    match = 0;
    corr_match = 0;
    for j = 0 : 9
        s = build_sound(j);
        if corr2(key, s) > corr_match
            corr_match = corr2(key, s);
            match = j;
        end
    end
    number(i) = match;
end
fprintf("%d", number)
fprintf('\n');
%}

[a, fs] = audioread('a.wav');

Ts = 1/fs;
Ton = 0.1;
Toff = 0.1;
t = 0 : Ts : length(a)/fs - Ts;

on_len = Ton * fs;
off_len = Toff * fs;
T = on_len + off_len;

number = zeros(1, 6);

for i = 1 : 6
    key = a((i-1)*T+1 : (i-1)*T + on_len + 1);
    match = 0;
    corr_match = 0;
    for j = 0 : 9
        s = build_sound(j);
        if corr2(key', s) > corr_match
            corr_match = corr2(key', s);
            match = j;
        end
    end
    number(i) = match;
end

fprintf("%d", number)
fprintf('\n');