function [G_J, c_J] = Jacobi_factorization(A, b)
N = diag(diag(A));
P = N - A;
invers_N = inv(N);
G_J = invers_N * P;
c_J = invers_N * b;
endfunction
