
keys = {'شماره ی', 'به باجه ی', 'یک', 'دو', 'سه', 'چهار', 'پنج', 'شش', 'هفت', 'هشت', 'نه', 'ده','یازده', 'دوازده', 'سیزده', 'چهارده', 'پانزده', 'شانزده', 'هفده', 'هجده', 'نوزده','بیست', 'سی', 'چهل', 'پنجاه', 'شصت', 'هفتاد', 'هشتاد', 'نود', 'و'};
values = {};
dec_numbers = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 30, 40, 50, 60, 70, 80, 90};
persian_nums = {'یک', 'دو', 'سه', 'چهار', 'پنج', 'شش', 'هفت', 'هشت', 'نه', 'ده','یازده', 'دوازده', 'سیزده', 'چهارده', 'پانزده', 'شانزده', 'هفده', 'هجده', 'نوزده','بیست', 'سی', 'چهل', 'پنجاه', 'شصت', 'هفتاد', 'هشتاد', 'نود'};
numbers = containers.Map(dec_numbers, persian_nums);
path = './voice/';

[sig, fr] = audioread([path, 'شماره ی.m4a']);
values{end + 1} = sig;
[sig, fr] = audioread([path, 'به باجه ی.m4a']);
values{end + 1} = sig;
for i = 1 : 19
    file_path = [path, num2str(i), '.m4a'];
    [sig, fr] = audioread(file_path);
    values{end + 1} = sig;
end
for i = 20 : 10 : 90
    file_path = [path, num2str(i), '.m4a'];
    [sig, fr] = audioread(file_path);
    values{end + 1} = sig;
end
[sig, fr] = audioread([path, 'و.m4a']);
values{end + 1} = sig;

sounds = containers.Map(keys, values);

% cat(1, sounds('شماره ی'), sounds('چهل'), sounds('و'), sounds('هشت'), sounds('به باجه ی'), sounds('نه'));
save('sounds.mat', 'sounds', 'fr', 'numbers');