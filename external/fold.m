function T = fold(M, mode, dT)
    n1 = dT(1);
    n2 = dT(2);
    n3 = dT(3);
    T = zeros(n1, n2, n3); 

    if (mode == 1)
        for i = 1 : n2
            T(:,i,:) = M(:, ((i-1)*n3+1):(i*n3));
        end
    elseif (mode == 2)
        for i = 1 : n3
            T(:,:,i) = M(:, ((i-1)*n1+1):(i*n1))';
        end
    elseif (mode == 3)
        for i = 1 : n1
            T(i,:,:) = M(:, ((i-1)*n2+1):(i*n2))';
        end
    end
end