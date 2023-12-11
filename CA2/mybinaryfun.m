function binary_picture = mybinaryfun(gray_picture, thresh)
    binary_picture = zeros(300, 500);
    for i = 1:300
        for j = 1:500
            if (gray_picture(i, j) > thresh)
                binary_picture(i, j) = 1;
            end
        end
    end
end