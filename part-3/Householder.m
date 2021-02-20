function [Q, R] = Householder(A)
  [m, n] = size(A);
  H = eye(m);
  for p = 1:min(m - 1, n)
    val_p = A(p, p) + sign(A(p, p)) * norm(A(p:m, p));
    vp = [zeros(p - 1, 1); val_p; A((p + 1):m, p)];
    Hp = eye(m) - 2/(vp' * vp) * vp * vp';
    A = Hp * A;
    H = Hp * H;
  endfor
  Q = H';
  R = A;
endfunction
