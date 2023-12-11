clc;
clearvars;
close all;

characters = ['a':'z', ' ', '.', ',', '!', '"', ';'];
char_cell = cell(2, 32);
for i = 0 : length(characters) - 1
    char_cell{1, i + 1} = char(characters(i + 1));
    char_cell{2, i + 1} = char(dec2bin(i, 5));
end
rate = 5;
sig = coding_amp('signal', rate, char_cell);
message = decoding_amp(sig, rate, char_cell);
% message

rand = randn(1, 3000);
% histogram(rand, 'Normalization', 'probability');
% fprintf("mean: %f, std: %f\n", mean(rand), std(rand));

noise_strength = 0;
noisy_sig = sig + noise_strength * randn(1, length(sig));
noisy_message = decoding_amp(noisy_sig, rate, char_cell);
noisy_message
