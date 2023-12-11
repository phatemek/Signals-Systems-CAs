function res = build_sound(n)
    fr = [697, 770, 852, 941];
    fc = [1209, 1336, 1477];
    fs = 8000;
    Ts = 1/fs;
    Ton = 0.1;
    T = 0:Ts:Ton;
    x = (n-1)/3;
    r = floor(x) + 1;
    c = mod(n-1, 3) + 1;
    if n == 0
        r = 4;
        c = 2;
    end
    y1 = sin(2 * pi * fr(r) * T);
    y2 = sin(2 * pi * fc(c) * T);
    res = (y1 + y2) / 2;
end