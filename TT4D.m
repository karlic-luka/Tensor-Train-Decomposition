function person = TT4D(z, G)
  % A je tenzor dimenzije (n_1, n_2, n_e, n_p), a z test slika od n_i piksela
  [~, n_e, n_p] = size(G{3});
  
  G12 = ten_mat_mult(G{2}, G{1}, 1);
  for e = 1 : n_e
    G3_e = squeeze(G{3}(:,e,:));
    C_e = ten_mat_mult(G12, G3_e', 3);
    temp = tenmat(C_e, 3, 't'); %tensor toolbox
%     alpha_e = temp.data \ z;
    [Q, R] = qr(temp.data, 0);
    for p = 1 : n_p
      g4_p = G{4}(:,p);
%       D_TT(e,p) = norm(alpha_e - g4_p,2);
      D_TT(e,p) = norm(inv(R)*Q'*z(:)-g4_p, 2);
    end
  end
  min_element = min(D_TT(:));
  [e_kappa, p_kappa] = find(D_TT==min_element);
  person = p_kappa;
end