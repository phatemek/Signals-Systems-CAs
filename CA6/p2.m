clc;
clearvars;

fs = 8000;
T = 0.5;
ts = 0;
te = T;
t = ts : 1/fs : te-1/fs;
tau = 0.025;
names = {'c', 'c#', 'd', 'd#', 'e', 'f', 'f#', 'g', 'g#', 'a', 'a#', 'b'};
freqs = [523.25, 554.37, 587.33, 622.25, 659.25, 698.46, 739.99, 783.99, 830.61, 880.00, 932.33, 987.77];
notes = cell(2, length(names));
for i = 1:length(names)
    notes{1, i} = names{i};
    notes{2, i} = freqs(i);
end

m1 = {{'d', T/2}, {'d', T/2}, {'g', T}, {'f#', T}, {'d', T},...
        {'d', T/2}, {'e', T/2}, {'e', T/2}, {'d', T/2}, {'f#', T/2}, {'d', T/2}, {'e', T/2}, {'d', T/2}, {'e', T/2}, {'f#', T/2}, {'e', T/2},...
        {'d', T}, {'e', T}, {'f#', T}, {'e', T}, ...
        {'d', T/2}, {'e', T/2}, {'e', T/2}, {'d', T/2}, {'f#', T/2}, {'d', T/2}, {'e', T},...
        {'d', T}, {'e', T/2}, {'d', T/2}, {'f#', T}, {'e', T}, ...
        {'d', T}, {'e', T/2}, {'d', T/2}, {'f#', T}, {'e', T}, ...
        {'d', T/2}, {'d', T/2}, {'e', T}, {'f#', T/2}, {'e', T/2}, {'f#', T}, ...
        {'f#', T/2}, {'e', T/2}, {'f#', T}, {'f#', T}, {'d', T}};

m1notes = cell(1, length(m1));
lens1 = zeros(1, length(m1));
for i = 1:length(m1)
    m1notes{i} = m1{i}{1};
    lens1(i) = m1{i}{2};
end
m1_sound = zeros(1, (sum(lens1) + length(lens1) * tau) * fs);
for i = 1:length(m1notes)
    s = sum(lens1(1:i-1)) + (i-1) * tau;
    e = s + lens1(i);
    m1_sound(round(s * fs) + 1 : round(e * fs)) = make_sound(m1notes(i), notes, fs, s, e);
end

m2 = {{'g', T/2}, {'a', T}, {'b', T/2}, {'c', T/2}, {'d', T}, {'e', T}, {'f#', T}};

m2notes = cell(1, length(m2));
lens = zeros(1, length(m2));
for i = 1:length(m2)
    m2notes{i} = m2{i}{1};
    lens(i) = m2{i}{2};
end
m2_sound = zeros(1, (sum(lens) + length(lens) * tau) * fs);
for i = 1:length(m2notes)
    s = sum(lens(1:i-1)) + (i-1) * tau;
    e = s + lens(i);
    m2_sound(round(s * fs) + 1 : round(e * fs)) = make_sound(m2notes(i), notes, fs, s, e);
end
sound(m2_sound, fs);
audiowrite("mysong.wav", m2_sound, fs);

no = no_sound();
cn = [];
parts = cell(1, 0);

for i = 1 : length(no) : length(m1_sound) - length(no)
    part = m1_sound(i : i + length(no) - 1);
    if sum(part) == 0 
        if length(cn) > 0
            parts{end + 1} = cn;
            cn = [];
        end
        continue;
    end
    cn = [cn, part];
end
parts{end + 1} = cn;
for i = 1 : length(parts)
    part = parts{i};
    recog_note(part, notes, fs);
end


function x = make_sound(note_name, notes, fs, t_start, t_end)
    idx = find(strcmp(notes(1, :), note_name));
    f = notes{2, idx};
    t = t_start : 1/fs : t_end - 1/fs;
    x = sin(2 * pi * f * t);
end

function res = no_sound()
    fs = 8e3;
    tstart = 0;
    ts = 1 / fs;
    tau = 25e-3;
    tend = tau - ts;
    t = tstart : ts : tend;
    res = sin(0 * t);
end

function recog_note(part, cells, fs)
    fourier = fftshift(fft(part));
    [~, mx_fourier] = max(abs(fourier));
    freq = abs(mx_fourier * fs/(length(part)) - floor(fs / 2) - 1);
    idx = recog_freq(cells, freq);
    fprintf("%s\n", cells{1, idx});
end

function note_index = recog_freq(notes, frequency)
    note_index = 1;
    min_diff = abs(notes{2, 1} - frequency);
    for i = 2:length(notes)
        diff = abs(notes{2, i} - frequency);
        if diff < min_diff
            min_diff = diff;
            note_index = i;
        end
    end
end