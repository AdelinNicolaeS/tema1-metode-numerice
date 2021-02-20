function [cost] = compute_cost_pc(points, centroids)
  N = rows(points);
  NC = rows(centroids);
  cost = 0;
  for i = 1:N
  	% calculez distanta minima pentru fiecare punct
    mn = norm(points(i, :) - centroids(1, :));
    poz = 1;
    for j = 2:NC
      if (mn > norm(points(i, :) - centroids(j, :)))
        mn = norm(points(i, :) - centroids(j, :));
        poz = j;
      endif
    endfor
    cost = cost + mn;
  endfor
endfunction

