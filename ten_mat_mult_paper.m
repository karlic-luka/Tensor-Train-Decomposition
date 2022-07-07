function C = ten_mat_mult_paper(A, B, mode)
    %input:
        %A: 3d tensor
        %B: matrix
        %mode: mode in which to multiplicate
    %output:
        %C: A x_mode B
    
    [n1, n2, n3] = size(A);
    n_mode = size(A, mode);
    if(size(B, 2) ~= n_mode)
       disp("Multiplication not defined. Wrong dimensions"); 
    end
    
    if(mode == 1)
        A = reshape(A, [n1, n2*n3]);
        A = B' * A;
        C = reshape(A, n_mode, n2, n3);
    elseif(mode == 2)
        A = reshape(permute(A, [1, 3, 2]), [n1*n3, n2]) * B;
        A = reshape(A, n1, n3, n_mode);
        C = permute(A, [1, 3, 2]);
    elseif(mode == 3)
        A = reshape(A, [n1*n2, n3]) * B;
        C = reshape(A, n1, n2, n_mode);
    end
    
    return
    
end