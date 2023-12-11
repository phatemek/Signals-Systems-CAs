function [] = calling_customer(n, m)
    load('sounds.mat');
    if n < 1 || n > 99
        fprintf("customer number is not between 1 and 99.\n");
        return
    end
    if m < 1 || m > 9
        fprintf("baje number is not between 1 and 9.\n");
        return
    end

    yekan = mod(n, 10);
    dahgan = floor(n/10);

    if n < 20 || yekan == 0
        call = cat(1, sounds('شماره ی'), sounds(numbers(n)), sounds('به باجه ی'), sounds(numbers(m)));
    else
        call = cat(1, sounds('شماره ی'), sounds(numbers(dahgan*10)), sounds('و'), sounds(numbers(yekan)), sounds('به باجه ی'), sounds(numbers(m)));
    end
    sound(call, fr);
end