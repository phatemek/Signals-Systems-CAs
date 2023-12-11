function binary = make_binary(message, mapset)
len = length(message);
    message = char(message);
    coded_message = zeros(1, len * 5);
    bin = '';
    for i = 1 : len
        lett = message(i);
        for j = 1 : 32
            if char(lett) == char(mapset(1, j))
                bin = char(mapset(2, j));
            end
        end
        k = i - 1;
        for t = 0 : 4
            coded_message(5 * k + t + 1) = str2double(bin(t + 1));
        end
    end
    binary = coded_message;
end