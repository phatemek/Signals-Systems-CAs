clc;
clearvars;
close all;
load FARSITRAIN.mat;
totalLetters=size(FARSITRAIN,2);

[file,path] = uigetfile({'*.jpg;*.bmp;*.png;*.tif'},'Choose an image');
s = [path,file];
picture = imread(s);
picture = imresize(picture,[300 500]);
plate = findplate(picture);
figure
imshow(plate)
gray_picture = mygrayfun(plate);
thresh = 116;
binary_picture = mybinaryfun(gray_picture, thresh);
binary_picture = 1 - binary_picture;
clean_picture = myremovecom(binary_picture, 800);
background = myremovecom(clean_picture, 6000);
clean_picture = clean_picture - background;
figure
imshow(clean_picture)
[L, Ne] = mysegmentation(clean_picture);
figure
final_output=[];
t=[];
for n=1:Ne
    [r,c] = find(L==n); 
    Y=clean_picture(min(r):max(r),min(c):max(c));
    % imshow(Y)
    Y=imresize(Y,[42,24]); 
    % imshow(Y)
    % pause(0.2)
    
    
    ro=zeros(1,totalLetters);
    for k=1:totalLetters
        ro(k)=corr2(imresize(Y, size(FARSITRAIN{1,k})), FARSITRAIN{1,k});
    end
    [MAXRO,pos]=max(ro);
    if MAXRO>.45
        out=cell2mat(FARSITRAIN(2,pos));       
        final_output=[final_output out];
    end
end

final_output
file = fopen('number_Plate.txt', 'wt'); 
fprintf(file,'%s\n',final_output);
fclose(file);