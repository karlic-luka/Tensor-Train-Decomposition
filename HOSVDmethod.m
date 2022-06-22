function person = HOSVDmethod(A, z)
  % A je tenzor dimenzije (n_i, n_e, n_p), a z test slika od n_i piksela
  [n_i, n_e, n_p] = size(A);
  z = z / norm(z);
  [S, F, G, H] = HOSVD(A);
  C = ten_mat_mult(ten_mat_mult(S, F, 1), G, 2);
  for e = 1 : n_e
    C_e = squeeze(C(:,e,:));
    nv = sqrt(sum(C_e));
    for i = 1 : n_p
      C_e(:,i) = C_e(:,i) / nv(i);
    end
    %alpha_e = pinv(C_e) * z;
    [U,S,V] = svd(C_e, 0);
    alpha_e = V * inv(S) * U' * z;
    for p = 1 : n_p
      h = H'(:,p);
      D_HO(e,p) = norm(alpha_e-h, 2);
    end
  end
  
  min_element = min(D_HO(:));
  [e_kappa, p_kappa] = find(D_HO==min_element);
  person = p_kappa;
  
end