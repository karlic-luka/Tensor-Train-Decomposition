addpath('data');
addpath('external');
addpath('external/tensor_toolbox-v3.2.1/');

% load images
load('data/YaleB_32x32.mat');
[nSmp,nFea] = size(fea);
for i = 1:nSmp
     fea(i,:) = fea(i,:) ./ max(1e-12,norm(fea(i,:)));
end

%indeksi za treniranje s 50 slika svake osobe
load('data/50Train/13.mat');
fea_Train = fea(trainIdx,:);
fea_Test = fea(testIdx,:);

gnd_Train = gnd(trainIdx);
gnd_Test = gnd(testIdx);
% load 4d tensors for TensorFaces method
path = 'data/CroppedYale';
downscale_factor = 3;
train_iluminations = 5;
[train4D, test4D] = loadExtendedYale4D(path, train_iluminations, downscale_factor);

%current variables:
    %I: train_tensor; width X n_samples X height
    %test_tensor: width X n_samples X height
    %train4D & test4D - 4-dim tensors

% number_of_tests = 100;
% percent = TensorFaces(train4D, test4D, number_of_tests);
% 
% %T-SVD
% k = 32;
% br_t = 20;
% postotak = T_SVD1(I, test_tensor(:, 1:br_t, :), k, gnd_Train, gnd_Test);
% 
% %T-QR
% k = 32;
% br_t = 100;
% postotak = T_QR(I, test_tensor(:, 1:br_t, :), k, gnd_Train, gnd_Test);

% priprema podataka valjda? TODO ENKAPSULIRATI!!!
% A = prepareTensor3D(fea_Train);





