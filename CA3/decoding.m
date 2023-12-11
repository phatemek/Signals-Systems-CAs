function result = decoding(picture, mapset)
    result_message = '';
    pic_size = size(picture);
    rows = pic_size(1);
    cols = pic_size(2);
    seq1 = 0;
    for r = 1 : rows
        flag = 0;
        for c = 1 : cols
            here = (r-1) * cols + c;
            if seq1 == 5
                flag = 1;
                break;
            end
            if mod(here, 5) == 1
                seq1 = 0;
            end
            if mod(picture(r, c), 2) == 0
                result_message = [result_message, '0'];
                seq1 = 0;
            else
                result_message = [result_message, '1'];
                seq1 = seq1 + 1;
            end
        end
        if flag == 1
            break;
        end
    end
    len = length(result_message);
    result = '';
    for i = 1 : len/5
        bin = result_message((i-1)*5+1:i*5);
        for j = 1 : 32
            if char(bin) == char(mapset(2, j))
                result = [result, char(mapset(1, j))];
                break;
            end
        end
    end
end


