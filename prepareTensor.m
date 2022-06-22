function A = prepareTensor(data)
    [ep, ni] = size(data);
    e = 11;
    p = 15;
    A = reshape(data', [ni, e, p]);
end