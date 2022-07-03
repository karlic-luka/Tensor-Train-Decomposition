function [S, U1, U2, U3] = HOSVD(A)
    %economic HOSVD for third-order tensor
    [n1, n2, n3] = size(A);

    if(n1 > n2*n3)
        [U1, ~, ~] = svd(unfold(A,1), 0);
    else
        [~, ~, U1] = svd(unfold(A,1)', 0);
    end

    if(n2 > n1*n3)
        [U2, ~, ~] = svd(unfold(A, 2), 0);
    else
        [~, ~, U2] = svd(unfold(A, 2)', 0);
    end

    if(n3 > n1*n2)
        [U3, ~, ~] = svd(unfold(A, 3), 0);
    else
        [~, ~, U3] = svd(unfold(A, 3)', 0);
    end
    S = ten_mat_mult(ten_mat_mult(ten_mat_mult(A, U1', 1), U2', 2), U3', 3); 
end