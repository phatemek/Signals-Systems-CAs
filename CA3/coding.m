function result_pic = coding(message, picture, mapset)
    len = length(message);
    message = char(message);
    coded_message = zeros(1, len * 5);
    bin = "";
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
    pic_size = size(picture);
    rows = pic_size(1);
    cols = pic_size(2);
    result_pic = picture;
    if cols * rows < 5 * len
        fprintf("picture size is small for this input.\n");
        return;
    end
    k = 1;
    for r = 1 : rows
        flag = 0;
        for c = 1 : cols
            if k > length(coded_message)
                flag = 1;
                break;
            end
            if coded_message(k) == 0
                result_pic(r, c) = result_pic(r, c) - mod(result_pic(r, c), 2);
            else
                added = 1 - mod(result_pic(r, c), 2);
                result_pic(r, c) = result_pic(r, c) + added;
            end
            k = k + 1;
        end
        if flag == 1
            break;
        end
    end
end