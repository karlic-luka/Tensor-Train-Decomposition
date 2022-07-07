function A = prepareTensor4D(data)
    %Prepares 4d tensor of dimensions: [rows, cols, expressions, people]
    %mostly for extended yale b face database used in data/
    %n_i = width * height
    %n_e: number of expressions
    %n_p: number of people
    %input:
        %data: vectorized images of size (n_samples x n_i)
    %output:
        %4D tensor of size (rows X cols X n_e X n_p)
    [ep, ni] = size(data);
    e = 50; %we use 50 expressions per people for train data
    p = ep/e;
    if(ni == 1024)
        rows = 32;
        cols = 32;
    elseif(ni == 1024*1024)
        rows = 64;
        cols = 64;
    end
    A = reshape(data', [rows, cols, e, p]);
end