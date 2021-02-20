function [w] = learn(X, y)
  Xx = [X ones(rows(X), 1)];
  w = SST(Xx, y);
end
