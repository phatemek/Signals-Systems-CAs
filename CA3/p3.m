clc;
clearvars;
close all;

[file, path] = uigetfile({'*.jpg;*.bmp;*.png;*.tif'}, 'choose PCB');
s = [path, file];
PCB = imread(s);
[file, path] = uigetfile({'*.jpg;*.bmp;*.png;*.tif'}, 'choose IC');
s = [path, file];
IC = imread(s);

grayPCB = rgb2gray(PCB);
grayIC = rgb2gray(IC);

grayIC_double = double(grayIC);
meanIC = mean(grayIC_double(:));
stdIC = std(grayIC_double(:));
normIC = (grayIC_double - meanIC) / stdIC;

thresh = 0.5;
[ICr, ICc] = size(normIC);
[PCBr, PCBc] = size(grayPCB);
rotIC = imrotate(normIC, 180);
figure;
imshow(PCB);
hold on;
for r = 1 : PCBr-ICr
    for c = 1 : PCBc-ICc
        part = grayPCB(r : r+ICr-1, c : c+ICc-1);
        part_double = double(part);
        
        meanpart = mean(part_double(:));
        stdpart = std(part_double(:));
        normpart = (part_double - meanpart) / stdpart;
        
        if (corrcoef(normIC, normpart) > thresh)
            pos = [c, r, ICc, ICr];
            rectangle('Position', pos, 'EdgeColor', 'r', 'LineWidth', 2);
        end 
        if (corrcoeff(rotIC, normpart) > thresh)
            pos = [c, r, ICc, ICr];
            rectangle('Position', pos, 'EdgeColor', 'r', 'LineWidth', 2);
        end
    end
end



