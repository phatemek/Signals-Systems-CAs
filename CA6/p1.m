clc;
clearvars;
close all;

s = 0;
e = 1;
fc = 5;
fs = 100;
t = s : 1/fs : e - 1/fs;
sent_sig = cos(2 * pi * fc * t);

% figure;
% plot(t, sent_sig);

v = 50;
r = 250000;
alpha = 0.5;
beta = 0.3;
fd = beta * v;
c = 3 * 10^8;
ro = 2/c;
td =  ro * r;
recieved_sig = alpha * cos(2 * pi * (fd + fc)*(t - td));

% figure;
% plot(t, recieved_sig);

ft = fftshift(fft(recieved_sig));
[~, peak] = max(abs(ft));
fdnew = abs(peak - floor(fs/2) - 1) - fc; 
phinew = angle(ft);
tdnew = phase(peak) / (2 * pi * (fdnew + fc));
vnew = fdnew / beta;
rnew = td * c / 2;

noise = randn(1, length(recieved_sig));
strength = 0 : 0.03 : 3;
thr = 0.1;
verr = zeros(1, length(strength));
rerr = zeros(1, length(strength));
resr = 0;
resv = 0;

for i = 1 : length(strength)
    currsig = alpha * cos(2 * pi * (fd + fc)*(t - td)) + strength(i) * noise;
    [currv, currr] = calc_v_r(currsig, fs, fc, beta);
    if (abs(currv - v) < thr * v)
        resv = strength(i);
    end
    if (abs(currr - r) < thr * r)
        resr = strength(i);
    end
    verr(i) = abs(currv - v) * 3.6;
    rerr(i) = abs(currr - r) / 1000;
end

resv;
resr;

r2 = 200000;
v2 = 60;
alpha2 = 0.6;
fd2 = beta * v2;
td2 = ro * r2;
recieved_sig2 = alpha2 * cos(2 * pi * (fd2 + fc)*(t - td2));
recieved_sig_all = recieved_sig + recieved_sig2;

figure;
plot(t, recieved_sig_all);

[v_all, r_all] = calc_vall_rall(recieved_sig_all, fs, fc, beta);

fprintf("r1: %f km, v1: %f km/h\n", r_all(1) / 1000, v_all(1) * 3.6);
fprintf("r2: %f km, v2: %f km/h\n", r_all(2) / 1000, v_all(2) * 3.6);


function [v, r] = calc_v_r(x, fs, fc, beta)
    fourier = fftshift(fft(x));
    [~, peak] = max(abs(fourier));
    fd = abs(peak - floor(fs / 2) - 1) - fc; 
    phase = angle(fourier);
    td = phase(peak) / (2 * pi * (fd + fc));
    c = 3 * 10^8;
    v = fd / beta;
    r = td * c / 2;
end

function [vall, rall] = calc_vall_rall(x, fs, fc, beta)
    fourier = fftshift(fft(x));
    [pks, locs] = findpeaks(abs(fourier));
    [~, idx] = sort(pks, 'descend');
    locs = locs(idx);
    fdall = zeros(1, 2);
    tdall = zeros(1, 2);
    phase = angle(fourier);
    fdall(1) = abs(locs(2) - fs/2 - 1) - fc;
    tdall(1) = abs(phase(locs(2))) / (2 * pi * (fdall(1) + fc));
    fdall(2) = abs(locs(4) - fs/2 - 1) - fc;
    tdall(2) = abs(phase(locs(4))) / (2 * pi * (fdall(2) + fc));
    c = 3 * 10^8;
    ro = 2 / c;
    vall = zeros(1, 2);
    rall = zeros(1, 2);
    for i = 1:2
        vall(i) = fdall(i) / beta;
        rall(i) = tdall(i) / ro;
    end
end