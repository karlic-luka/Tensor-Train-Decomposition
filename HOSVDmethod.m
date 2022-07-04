function person = HOSVDmethod(C, H, z)
  % A je tenzor dimenzije (n_i, n_e, n_p), a z test slika od n_i piksela
  [~, n_e, n_p] = size(C);
  z = z / norm(z);
%   [S, F, G, H] = HOSVD(A);
%   C = ten_mat_mult(ten_mat_mult(S, F, 1), G, 2);
%   for e = 1 : n_e
%     C_e = squeeze(C(:,e,:));
%     nv = sqrt(sum(C_e));
% %     alpha_e = C_e \ z;
%     for i = 1 : n_p
%       C_e(:,i) = C_e(:,i) / nv(i);
%     end
%     %alpha_e = pinv(C_e) * z;
%     [U,S,V] = svd(C_e, 0);
%     alpha_e = V * inv(S) * U' * z;
%     for p = 1 : n_p
%       h = H(:,p)';
%       D_HO(e,p) = norm(alpha_e-h, 2);
%     end
%   end
%   
%   min_element = min(D_HO(:));
%   [~, p_kappa] = find(D_HO==min_element);
%   person = p_kappa;
tolerancija = Inf;
reziduali = zeros(n_e, n_p);
    for e = 1:n_e
        C_e = squeeze(C(:, e, :));
        x_e = C_e\z;
        for p = 1:n_p
            hp = H(p, :);
    %         xe - hp' %PAZI NA VEKTORE STUPCE I SLICNO!!!
            rez = norm(x_e - hp');
            reziduali(e, p) = rez;

            if rez < tolerancija
                tolerancija = rez;
                argp = p;
                arge = e;
            end
        end
    end
  person = argp;
end