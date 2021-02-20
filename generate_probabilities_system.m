function [A, b] = generate_probabilities_system(rows)
n = rows/2 * (rows + 1);
b = zeros(n, 1);
for i = (n - rows + 1):n
  b(i) = 1;
endfor
A = zeros(n);
A(1,1) = 4;
A(n, n) = 4;
A(n - rows + 1, n - rows + 1) =4;
for i = 2:rows
  start = 1 + i/2 * (i - 1);
  sfarsit=i/2 * (i + 1);
  if (i == rows)
    for j = (start+1):(sfarsit-1)
      A(j, j) = 5;
      A(j, j - 1) = -1;
      A(j, j - i) = -1;
      A(j, j - i + 1) = -1;
    endfor
    A(start, start - i + 1) = -1;
    A(sfarsit, sfarsit - i) = -1;
    A(sfarsit, sfarsit - 1) = -1;
  else
    for j=start:sfarsit
    if(j == start)
    A(j, j) = 5;
    A(j, j - i + 1) = -1;
  elseif (j == sfarsit)
    A(j, j) = 5;
    A(j, j - 1) = -1;
    A(j, j - i) = -1;
  else 
    A(j, j) = 6;
    A(j, j - 1) = -1;
    A(j, j - i) = -1;
    A(j, j - i + 1) = -1;
  endif
endfor
endif
endfor
for i = 1:n
  for j = (i + 1):n
    A(i, j) = A(j, i);
  endfor
endfor
endfunction