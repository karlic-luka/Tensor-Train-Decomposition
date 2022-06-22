function X_k = unfold(X, dims, k)

    rows = 1;
    for i = 1:k
        rows = rows * size(X, i);
    end
    
    cols = 1;
    for i = (k+1):dims
       cols = cols * size(X, i); 
    end
    
    X_k = reshape(X, rows, cols);
end