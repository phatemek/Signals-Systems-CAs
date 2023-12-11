function message = decoding_amp(signal, rate, mapset)
    freq = 100;
    t = 0 : 1/freq : (length(signal)-1)/freq;

    % figure;
    % plot(t, signal);
    
    len = length(signal) / freq;
    bin = '';
    for i = 1 : len
        part = signal((i-1) * freq + 1 : i * freq);
        sm = sum(part .* (2 * sin(2 * pi * t((i-1) * freq + 1 : i * freq))));
        corr_coeff = abs(0.01 * sm);
        thrm = pow2(rate)-1;
        err = 1/(2 * thrm);
        curr_bin = '';
        for j = 0 : thrm
            thresh = j / thrm;
            if abs(thresh - corr_coeff) <= err
                curr_bin = dec2bin(j, rate);
            end
        end
        bin = [bin, curr_bin];
    end
    message = make_text(bin, mapset);
end