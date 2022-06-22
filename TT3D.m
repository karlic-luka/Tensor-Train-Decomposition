function person = TT3D(z, A)
  % A je tenzor dimenzije (n_i, n_e, n_p), a z test slika od n_i piksela
  [n_i, n_e, n_p] = size(A);
  G = TTdecomposition(A);
  z_kappa = G{1}' * z;
  for e = 1 : n_e
    G2_e = squeeze(G{2}(:,e,:));
    %alpha_e = pinv(G2_e) * z_kappa;
    [Q, R] = qr(G2_e, 0);
    for p = 1 : n_p
      g3_p = G{3}(:,p);
      %D_TT(e,p) = norm(alpha_e - g3_p,2);
      D_TT(e,p) = norm(inv(R)*Q'*z_kappa - g3_p, 2);
    end
  end
  
  min_element = min(D_TT(:));
  [e_kappa, p_kappa] = find(D_TT==min_element);
  person = p_kappa;
end