function A = prepareTensor3D(data)
    %Prepares 3d tensor of dimensions: [n_pixels, expressions, people]
    %mostly for extended yale b face database used in data/
    %n_i = width * height
    %n_e: number of expressions
    %n_p: number of people
    %input:
        %data: vectorized images of size (n_samples x n_i)
    %output:
        %3D tensor of size (n_i X n_e X n_p)
    [ep, ni] = size(data);
    e = 50; %we use 50 expressions per people for train data
    p = ep/e;
    A = reshape(data', [ni, e, p]);
end