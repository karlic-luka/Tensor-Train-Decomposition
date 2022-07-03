number_of_tests = 10;
batch = randi(50, 1, number_of_tests);
batch

addpath('data');
addpath('external');
addpath('external/tensor_toolbox-v3.2.1/');

% load images
load('data/YaleB_32x32.mat');
for i = 1:nSmp
     fea(i,:) = fea(i,:) ./ max(1e-12,norm(fea(i,:)));
end

data = zeros(number_of_tests, 3);
for(i = 1:number_of_tests)
    [fea_Train, fea_Test, gnd_Train, gnd_Test] = ExtractRandomDataset(fea, gnd, batch(i));
    %TT3D
    percentage = RunAlgorithmTT3D(fea_Train, fea_Test, gnd_Test);
    data(i, 1) = percentage;
    fprintf('Batch: %s', i);
    fprintf('Percentage of correct recognitions for TT3D: %s %% \n', num2str(percentage * 100));
    %TT4D
    percentage = RunAlgorithmTT4D(fea_Train, fea_Test, gnd_Test);
    data(i, 2) = percentage;
    fprintf('Percentage of correct recognitions for TT4D: %s %% \n', num2str(percentage * 100));
    %TT4D
    percentage = RunAlgorithmLeastSquares(fea_Train, fea_Test, gnd_Test);
    data(i, 3) = percentage;
    fprintf('Percentage of correct recognitions for LeastSquares: %s %% \n', num2str(percentage * 100));
end