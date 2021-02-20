function [centroids] = clustering_pc(points, NC)
  lg_linie_clusters = zeros(NC, 1);
  clusters = zeros(NC, 1);
  N = rows(points);
  D = columns(points);
  centroids = zeros(NC, D);
  % obtinere clusters
  for i = 1:N
    if mod(i, NC) == 0
      lg_linie_clusters(NC) = lg_linie_clusters(NC) + 1;
      clusters(NC, lg_linie_clusters(NC)) = i;
    else
      lg_linie_clusters(mod(i, NC))++;
      clusters(mod(i, NC), lg_linie_clusters(mod(i, NC))) = i;
    endif
  endfor
  % calcul initial centroizi
  for i = 1:NC
    for j = 1:D
      m = 0;
      for k = 1:lg_linie_clusters(i)
        m = m + points(clusters(i, k), j);
      endfor
      centroids(i, j) = m/lg_linie_clusters(i);
    endfor
  endfor
  prev = zeros(NC, D);
  it = 0;
  % recalculare centroizi pana nu se mai modifica
  while norm(prev - centroids, 2)>0
    it++;
    prev = centroids;
    clusters = zeros(NC, 1);
    lg_linie_clusters = zeros(NC, 1);
    for i = 1:N
      poz = 1;
      mn = norm(centroids(1, :) - points(i, :), 2);
      for j = 2:NC
        if (norm(centroids(j, :) - points(i, :), 2) < mn)
          mn = norm(centroids(j, :) - points(i, :), 2);
          poz = j;
        endif
      endfor
      lg_linie_clusters(poz)++;
      clusters(poz, lg_linie_clusters(poz)) = i;
    endfor
    for i = 1:NC
     for j = 1:D
      m = 0;
      for k = 1:lg_linie_clusters(i)
        m = m + points(clusters(i, k), j);
      endfor
      centroids(i, j) = m/lg_linie_clusters(i);
    endfor
  endfor
endwhile
endfunction
