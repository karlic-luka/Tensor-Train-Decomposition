function person = LeastSquares2(A, z)
  % A je tenzor dimenzije (n_i, n_e, n_p), a z test slika od n_i piksela
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
    I = eye(n_p);
    for p = 1 : n_p
      D(e,p) = norm(x{e}-I(:,p), 2);
    end
  end
  
  min_element = min(D(:));
  [e_kappa, p_kappa] = find(D==min_element);
  person = p_kappa;
  
end  