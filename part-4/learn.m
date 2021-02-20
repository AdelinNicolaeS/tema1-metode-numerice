function [w] = learn(X, y, lr, epochs)
  X = (X - mean(X))./std(X);
  bach_size = 64;
  Xx = [X ones(rows(X), 1)];
  w = -0.1 + 0.2*rand(columns(Xx), 1);
  for epoch = 1:epochs
    rows_batch = randperm(rows(Xx), bach_size);
    X_batch = Xx(rows_batch, :);
    y_batch = y(rows_batch, 1);
    for i = 1:rows(w)
      w(i, 1) = w(i, 1) - lr/rows(X) * sum((X_batch * w - y_batch).*X_batch(:, i));
    endfor
    endfor
endfunction
