function result = coding_freq(message, rate, mapset)
    coded_message = make_binary(message, mapset);
    len = length(coded_message);
    freq = 100;
    max_f = 49;
    t = linspace(0, len/rate, len/rate * freq);
    result = zeros(1, length(t));
    for i = 1 : rate : len
        part = coded_message(i : i + rate - 1);
        bin_str = num2str(part);
        dec_part = bin2dec(bin_str);
        sig_f = (max_f * (dec_part + 1) / (pow2(rate) + 1));
        result((i-1)/rate*freq + 1 : ((i-1)/rate + 1)*freq) = sin(2 * pi * sig_f * t((i-1)/rate*freq + 1 : ((i-1)/rate + 1)*freq));
    end
end
