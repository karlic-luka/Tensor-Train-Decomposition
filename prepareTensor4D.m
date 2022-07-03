function A = prepareTensor4D(data)
    %Prepares 4d tensor of dimensions: [rows, cols, expressions, people]
    [ep, ni] = size(data);
    e = 50; %we use 50 expressions per people
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