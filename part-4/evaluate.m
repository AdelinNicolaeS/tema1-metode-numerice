function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  [X, y] = preprocess(path_to_testset, histogram, count_bins);
  X = (X-mean(X))./std(X);
  Xx = [X ones(rows(X), 1)];
  % noul y
  my_y = w' * Xx(1:rows(Xx), :)';
  % verific daca predictiile coincid
  percentage = length(find(sign(my_y) == sign(y')))/length(y);
endfunction