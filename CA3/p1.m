clc;
clearvars;
close all;

characters = ['a':'z', ' ', '.', ',', '!', '"', ';'];
char_cell = cell(2, 32);
for i = 0 : length(characters) - 1
    char_cell{1, i + 1} = char(characters(i + 1));
    char_cell{2, i + 1} = char(dec2bin(i, 5));
end

[file, path] = uigetfile({'*.jpg;*.bmp;*.png;*.tif'});
s = [path, file];
picture = imread(s);
picture = rgb2gray(picture);

message = 'signal;';
coded_pic = coding(message, picture, char_cell);
figure;
subplot(1, 2, 1)
imshow(picture)
title('main picture')
hold on;
subplot(1, 2, 2)
imshow(coded_pic)
title('coded picture')

decoded_message = decoding(coded_pic, char_cell)