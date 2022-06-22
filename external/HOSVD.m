function [ S, U1, U2, U3 ] = HOSVD( A )
% Racuna HOSVD tenzora A.
%
% Dio nastavnog materijala na  
% PMF-Matematicki odsjek, Sveuciliste u Zagrebu
% Diplomski kolegij Uvod u slozeno pretrazivanje podataka (© Zlatko Drmac)
%
% Ulazni parametri
% ================
% A - tenzor reda 3 
% Izlazni parametri
% =================
% S - jezgreni tenzor, istih dimenzija kao i A 
% U1, U2, U3 - ortogonalne matrice 
% Vrijedi A = S x_1 U1 x_2 U2 x_3 U3
%.......................................................................... 

[ U1, ~, ~ ] = svd( unfold( A, 1) ) ;
[ U2, ~, ~ ] = svd( unfold( A, 2) ) ;
[ U3, ~, ~ ] = svd( unfold( A, 3) ) ;

S = ten_mat_mult(ten_mat_mult(ten_mat_mult(A,U1',1),U2',2),U3',3) ; 

end
