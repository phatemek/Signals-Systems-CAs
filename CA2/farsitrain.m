clc;
close all;
clear;

directory = '/Users/phateme/University/T5/Signal/P2/train/Farsi_mapset';
di = dir(directory);
st = {di.name};
nam = st(3:end);
len = length(nam);

FARSITRAIN = cell(2, len);
for i = 1:len
    FARSITRAIN(1,i)={imread([directory,'/',cell2mat(nam(i))])};
    temp=cell2mat(nam(i));
    FARSITRAIN(2,i)={temp(1)};
end

save('FARSITRAIN.mat', "FARSITRAIN");
clear;
