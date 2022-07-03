function A = prepareTensor3D(data)
    %Prepares 3d tensor of dimensions: [n_pixels, expressions, people]
    [ep, ni] = size(data);
    e = 50; %we use 50 expressions per people
    p = ep/e;
    A = reshape(data', [ni, e, p]);
end