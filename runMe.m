addpath('data');
addpath('external');

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

count1 = 1;
count2 = 1;
for i = 1 : size(fea,1)
    if ismember(i,trainIdx)
        I(:,count1,:) = reshape(fea_Train(count1,:),[32,32]) ;
        count1 = count1 + 1;
    else
        test_tensor(:,count2,:) = reshape(fea_Test(count2,:),[32,32]) ;
        count2 = count2 + 1;
    end
end

% load 4d tensors for TensorFaces method
path = 'data/CroppedYale';
downscale_factor = 1;
train_iluminations = 5;
[train, test] = loadExtendedYale(path, train_iluminations, downscale_factor);
number_of_tests = 100;
percent = TensorFaces(train, test, number_of_tests);

%T-SVD
k = 32;
br_t = 20;
postotak = T_SVD1(I, test_tensor(:, 1:br_t, :), k, gnd_Train, gnd_Test);

%T-QR
k = 32;
br_t = 100;
postotak = T_QR(I, test_tensor(:, 1:br_t, :), k, gnd_Train, gnd_Test);








