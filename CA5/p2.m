clc;
clearvars;

characters = ['a':'z', ' ', '.', ',', '!', '"', ';'];
char_cell = cell(2, 32);
for i = 0 : length(characters) - 1
    char_cell{1, i + 1} = char(characters(i + 1));
    char_cell{2, i + 1} = char(dec2bin(i, 5));
end
rate = 1;
signal = coding_freq('signal', rate, char_cell);
decoded = decoding_freq(signal, rate, char_cell)

noise_strength = 0.01;
noisy_sig = signal + noise_strength * randn(1, length(signal));
len = length(make_binary('signal', char_cell));
freq = 100;
t = linspace(0, len/rate, len/rate * freq);
figure;
plot(t, noisy_sig)
noisy_message = decoding_freq(noisy_sig, rate, char_cell);
noisy_message
