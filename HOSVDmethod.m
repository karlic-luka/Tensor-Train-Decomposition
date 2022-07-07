function person = HOSVDmethod(C, H, z)
  %HOSVD decomposition of a tensor
  %if size of A is [n_i, n_e, n_p] and A = S x F x G x G, then...
  %input:
    %C: S x F x G of size [n_i, n_e, n_p]
    %z: image to be classified; size = n_i
  %output:
    %index of a classified person (from 1 to n_p)
    [~, n_e, n_p] = size(C);
    z = z / norm(z);
    tolerancija = Inf;
    reziduali = zeros(n_e, n_p);
    for e = 1:n_e
        C_e = squeeze(C(:, e, :));
        x_e = C_e\z;
        for p = 1:n_p
            hp = H(p, :);
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