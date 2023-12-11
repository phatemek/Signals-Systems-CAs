clc;           
clear;        
close all;  

directory = '/Users/phateme/University/T5/Signal/P2/train/English_mapset';
di = dir(directory);
st={di.name};
nam=st(3:end);
len=length(nam);

TRAIN=cell(2,len);
for i=1:len
   TRAIN(1,i)={imread([directory,'/',cell2mat(nam(i))])};
   temp=cell2mat(nam(i));
   TRAIN(2,i)={temp(1)};
end

save('TRAININGSET.mat','TRAIN');
clear;
