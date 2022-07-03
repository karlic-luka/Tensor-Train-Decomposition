function G = TTdecomposition(A)
  % Za tenzor A proizvoljnog reda vraca TT-jezgre G_i
  dim = size(A); 
  d = length(dim); 
  r = zeros(d,1);
  r0 = 1; r(d) = 1;  
  C = A; 
  
  for k = 1 : d-1
    if k > 1 
       C = reshape(C, [r(k-1)*dim(k), numel(C)/(r(k-1)*dim(k))]); 
    else
       C = reshape(C, [r0*dim(k), numel(C)/(r0*dim(k))]);    
    end
    [U,S,V] = svd(C, 'econ'); 
    %[U,S,V] = svds(C,90); 
    %[U,S,V] = qr(C); V0 = V;    
    r(k) = rank(S); 
    V = V(:,1:r(k)); 
    U = U(:,1:r(k));
    if k > 1 
       G{k} = reshape(U, [r(k-1),dim(k),r(k)]);
    else
       G{k} = squeeze(reshape(U,[r0,dim(k),r(k)]));
    end
    C = S(1:r(k),1:r(k)) * V'; 
    %C = S(1:r(k),:)*V0';
  end
  G{d} = C;

end