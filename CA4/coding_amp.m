function result = coding_amp(message, rate, mapset)
    coded_message = make_binary(message, mapset);
    len = length(coded_message);
    freq = 100;
    t = linspace(0, len/rate, len/rate * freq);
    result = zeros(1, length(t));
    for i = 1 : rate : len
        part = coded_message(i : i + rate - 1);
        bin_str = num2str(part);
        sig_dom = bin2dec(bin_str)/(pow2(rate)-1);
        result((i-1)/rate*freq + 1 : ((i-1)/rate + 1)*freq) = sig_dom * sin(2 * pi * t((i-1)/rate*freq + 1 : ((i-1)/rate + 1)*freq));
    end
    % figure;
    % plot(t, result);
end
