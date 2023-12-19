function message = decoding_freq(signal, rate, mapset)
    fs = 100;
    t = 0 : 1/fs : (length(signal)-1)/fs;
    N = 100;
    f = -fs/2 : fs/N : fs/2 - fs/N;
    max_f = 49;
    
    len = length(signal) / fs;
    bin = '';
    for i = 1 : len
        part = signal((i-1) * fs + 1 : i * fs);
        Fp = fftshift(fft(part));
        [~, idx] = max(real(Fp));
        thrm = pow2(rate)+1;
        err = max_f/(2 * thrm);
        curr_bin = '';
        for j = 1 : thrm-1
            thresh = j * max_f / thrm;
            if abs(thresh + f(idx(end)) <= err)
                curr_bin = dec2bin(j-1, rate);
            end
        end
        bin = [bin, curr_bin];
    end
    message = make_text(bin, mapset);
end