function person = TT4D(z, A)
  % A je tenzor dimenzije (n_1, n_2, n_e, n_p), a z test slika od n_i piksela
  [n_1, n_2, n_e, n_p] = size(A);
  G = TTdecomposition(A);
  G12 = ten_mat_mult(G{2}, G{1}, 1);
  for e = 1 : n_e
    G3_e = squeeze(G{3}(:,e,:));
    C_e = ten_mat_mult(G12, G3_e');
    %alpha_e = pinv(unfold(C_e)) * z; % vjerojatno treba koristiti unfold iz Matlab Tensor Toolbox-a
    [Q, R] = qr(unfold(C_e));
    for p = 1 : n_p
      g4_p = G{4}(:,p);
      %D_TT(e,p) = norm(alpha_e - g4_p,2);
      D_TT(e,p) = norm(inv(R)*Q'*z(:)-g3_p, 2);
    end
  end
  min_element = min(D_TT(:));
  [e_kappa, p_kappa] = find(D_TT==min_element);
  person = p_kappa;
end