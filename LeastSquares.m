function person = LeastSquares(A, z)
    %Least squares method for image classification
    %Algorithm 4.1 from paper 
    %https://link.springer.com/article/10.1007/s10092-020-0358-8
    %input:
        %A: tensor of (n_i, n_e, n_p)
        %z: image to be classified; size n_i
    %output:
        %index of a recognized person (1 to n_p)
  [~, n_e, n_p] = size(A);
  z = z / norm(z);
  for e = 1 : n_e
    A_e = squeeze(A(:,e,:));
    nv = sqrt(sum(A_e));
    for i = 1 : n_p
      A_e(:,i) = A_e(:,i) / nv(i);
    end
    %x{e} = pinv(A_e) * z;
    [U,S,V] = svd(A_e, 0);
    x{e} = V * inv(S) * U' * z; 
    r{e} = z - A_e * x{e};
    normres(e) = norm(r{e}, 2);
  end
  
  [~, e_kappa] = min(normres);
  [~, p_kappa] = max(abs(x{e_kappa}));
  person = p_kappa;
  
end  