function [values, colind, rowptr] = matrix_to_csr(A)
n = length(A);
nz = 0;
% nz = numarul de elemente nenule
for i = 1:n
  prim_indice = -1;
  for j = 1:n
    if (A(i, j) != 0)
    nz = nz + 1;
    % adaug la values si colind
    values(nz) = A(i, j);
    colind(nz) = j;
    if(prim_indice == -1)
    prim_indice = 1;
    rowptr(i) = nz;
  endif
endif
endfor
endfor
rowptr(n + 1) = nz + 1;
endfunction