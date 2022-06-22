function v = vec(A)
    %v = A(:);
    [n,m] = size(A);
    v = reshape(A,n*m,1);
end