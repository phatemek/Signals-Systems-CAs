function plate = findplate(picture)
blue_part = zeros(300, 500);
    for i = 1:300
        for j = 1:500
            if picture(i, j, 1) + picture(i, j, 2) < 150 && picture(i, j, 3) > 100
                blue_part(i, j) = 1;
            end
        end
    end
    blue_part = myremovecom(blue_part, 20);
    background = myremovecom(blue_part, 1200);
    blue_part = blue_part - background;
    [r,c] = find(blue_part == 1); 
    bluej_len = max(c) - min(c);
    plate = picture(min(r)-10:max(r)+5, min(c):max(c) + 12 * bluej_len, :);
    figure
    imshow(blue_part)
    plate = imresize(plate, [300, 500]);
end