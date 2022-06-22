function [train, test] = loadExtendedYale(path, k, downscale_factor)
    % helper function to load ExtendedYale dataset as a 4th order tensor
    % of dimension people X ilumination X width X height
    % input: 
            % path: path to dataset
            % k: number of ilumination samples for test dataset
            % downscale_factor: factor to scale rows and cols
    % output:
            % train and test dataset with mentioned dimensions
            
    % path = "E:\PMF\4.godina\2.semestar\MMP\seminar1\data\CroppedYale";
    folder_info = dir(path);
    num_people = 30; % hardcoded 
    test = zeros(num_people, k, 192/downscale_factor, 168/downscale_factor);
    train = zeros(num_people, 64-k, 192/downscale_factor, 168/downscale_factor);

    for i = 1:num_people
        test_count = 0;
        osoba = fullfile(folder_info(i+2).folder, folder_info(i+2).name);
        ilum_info = dir(fullfile(osoba, '*.pgm'));
        ilum_info = StrStructPerm(ilum_info);
        for j = 1:65
            temp_ilum = fullfile(ilum_info(j).folder, ilum_info(j).name);
            if (contains(temp_ilum, 'Ambient') == 0)
                [image, ~] = getpgmraw(temp_ilum);
                if(j <= 64-k+1)
                   train(i, j, :, :) = imresize(image, 1/downscale_factor);
                else
                   test_count = test_count + 1;
                   test(i, test_count, :, :) = imresize(image, 1/downscale_factor);
                end
            end
        end

    end
end