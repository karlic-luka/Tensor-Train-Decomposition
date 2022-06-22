function [fea_Train, fea_Test, gnd_Train, gnd_Test] = prepareData(fea, gnd)
    %===========================================
    % trebam split file
    fea_Train = fea(trainIdx,:);
    fea_Test = fea(testIdx,:);

    gnd_Train = gnd(trainIdx);
    gnd_Test = gnd(testIdx);
%===========================================


end