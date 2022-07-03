function percentage = RunAlgorithmTT4D(train, test, gt)

    %input:
        %train: train dataset
        %test: test dataset
        %gt: ground truth; indexes of the correct person

    n_samples = size(test, 1);
    A = prepareTensor4D(train);
    G = TTdecomposition(A);
    
    count = 0;
    for(i = 1:n_samples)
       z = reshape(test(i, :), [32, 32]);
       person = TT4D(z, G);
       
       if(person == gt(i))
           count = count + 1;
       end
       fprintf('Current percentage after iter %s is %s %% \n', num2str(i), num2str(count/i * 100));
    end
    percentage = count / n_samples;
    fprintf('Final percentage of correct recognitions: %s %% \n', num2str(percentage * 100));
end