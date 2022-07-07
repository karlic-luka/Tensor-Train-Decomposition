function X_k = unfold_paper(X, k)
    %unfolding a N-dim tensor X in a mode k from paper
    %https://link.springer.com/article/10.1007/s10092-020-0358-8
    %input:
        %X: n-dim tensor
        %K: mode
    %output:
        %matricizied tensor
    dims = ndims(X);
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