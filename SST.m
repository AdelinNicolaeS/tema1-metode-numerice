function [x] = SST(A, b)
  [Q, R] = Householder(A);
  b = Q' * b;
  [m, n] = size(R);
  for i = min(m, n):-1:1
    val = b(i, 1);
    for j = (i + 1):min(m, n)
      val = val - R(i, j) * x(j, 1);
    endfor
    x(i, 1) = val/R(i, i);
  endfor
end
    