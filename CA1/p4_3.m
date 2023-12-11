function[] = p4_3(x, speed, fs)
    if speed ~= 0.5 && speed ~= 2
        fprintf('error');
        return
    end
    if speed == 2
        speed2 = x(2:2:end);
        sound(speed2, fs)
    else
        speed_half = zeros(2 * size(x));
        for i = 1 : length(x) - 1
            speed_half(2 * i - 1) = x(i);
            speed_half(2 * i) = (x(i) + x(i+1)) / 2;
        end
        sound(speed_half, fs)
    end

end