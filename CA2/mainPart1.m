clc;
clearvars;
close all;
load TRAININGSET;
totalLetters=size(TRAIN,2);

[file,path] = uigetfile({'*.jpg;*.bmp;*.png;*.tif'},'Choose an image');
s = [path,file];
picture = imread(s);

picture = imresize(picture,[300 500]);

gray_picture = mygrayfun(picture);

thresh = 90;
binary_picture = mybinaryfun(gray_picture, thresh);
binary_picture = 1 - binary_picture;

clean_picture = myremovecom(binary_picture, 300);
background = myremovecom(clean_picture, 2300);
clean_picture = clean_picture - background;

figure
imshow(clean_picture)
hold on
[L, Ne] = mysegmentation(clean_picture);
propied=regionprops(L,'BoundingBox'); 
for n=1:size(propied,1)
    rectangle('Position',propied(n).BoundingBox,'EdgeColor','r','LineWidth',2)
    
end
hold off
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
        ro(k)=corr2(TRAIN{1,k},Y);
    end
    [MAXRO,pos]=max(ro);
    if MAXRO>.45
        out=cell2mat(TRAIN(2,pos));       
        final_output=[final_output out];
    end
end

final_output
file = fopen('number_Plate.txt', 'wt'); 
fprintf(file,'%s\n',final_output);
fclose(file);