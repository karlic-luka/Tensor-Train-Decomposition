function M = unfold(T, mode)
    [n1,n2,n3] = size(T);
    if (mode == 1)
        M = squeeze(T(:,1,:));
        for i = 2 : n2
            M = [M squeeze(T(:,i,:))];
        end
    elseif (mode == 2)
        M = T(:,:,1)';
        for i = 2 : n3
            M = [M T(:,:,i)'];
        end
    elseif (mode == 3)
        M = shiftdim(T(1,:,:), 1)';
        for i = 2 : n1
            M = [M shiftdim(T(i,:,:), 1)'];
        end
    end
end