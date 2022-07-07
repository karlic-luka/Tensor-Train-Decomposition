function [fea_Train, fea_Test, gnd_Train, gnd_Test] = ExtractRandomDataset(fea, gnd, data_index)
    %Method that splits dataset into train and test
    %e.g. http://www.cad.zju.edu.cn/home/dengcai/Data/FaceData.html
    %extended yale face database B 32x32
    %input:
        %data_index: index of a folder (1 to 50)
    
addpath('data/50Train');
if(~(1 <= data_index <= 50))
    disp('Invalid index. It should be 1 to 50');
    return
end
load(strcat('data/50Train/', num2str(data_index), '.mat'));
fea_Train = fea(trainIdx,:);
fea_Test = fea(testIdx,:);

gnd_Train = gnd(trainIdx);
gnd_Test = gnd(testIdx);

end