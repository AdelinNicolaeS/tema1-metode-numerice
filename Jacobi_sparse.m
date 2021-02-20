function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
prev = zeros(length(G_rowptr) - 1, 1);
y = csr_multiplication(G_values, G_colind, G_rowptr, prev);
x = y + c;
err = norm(x - prev);
prev = x;
while err >= tol
  y = csr_multiplication(G_values, G_colind, G_rowptr, prev);
  x = y + c;
  err = norm(x - prev);
  prev = x;
  endwhile
endfunction