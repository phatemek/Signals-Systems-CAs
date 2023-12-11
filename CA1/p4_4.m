function [] = p4_4(x, speed, fs)
    if speed <= 1
        mult = 1/speed;
        rem = 0.0;
        speed_down = [];
        for i = 1 : length(x)-1
            avg = (x(i) + x(i+1)) / 2;
            speed_down = horzcat(speed_down, x(i));
            for j = 1 : floor(mult)-1
                speed_down = horzcat(speed_down, avg);
            end
            rem = rem + (mult - floor(mult));
            if rem >= 1
                rem = rem - 1;
                speed_down = horzcat(speed_down, avg);
            end
        end
        sound(speed_down, fs);
    else
        speed_up = [];
        idx = 1;
        rem = 0.0;
        for i = 1 : round(length(x) / speed)
            count = floor(speed);
            rem = rem + (speed - floor(speed));
            if rem >= 1
                rem = rem - 1;
                count = count + 1;
            end
            speed_up = horzcat(speed_up, x(idx));
            idx = idx + count;
        end
        sound(speed_up, fs);
    end
end