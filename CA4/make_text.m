function result = make_text(binary, mapset)
    len = length(binary);
    result = '';
    for i = 1 : len/5
        bin = binary((i-1)*5+1:i*5);
        for j = 1 : 32
            if char(bin) == char(mapset(2, j))
                result = [result, char(mapset(1, j))];
                break;
            end
        end
    end
end