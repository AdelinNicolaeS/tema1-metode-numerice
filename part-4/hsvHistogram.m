function [sol] = hsvHistogram(path_to_image, count_bins)
  % obtin fiecare culoare
  image = imread(path_to_image);
  red = double(image(:, :, 1));
  green = double(image(:, :, 2));
  blue = double(image(:, :, 3));
  sol = zeros(1, 3 * count_bins);
  i = 1:count_bins;
  edges = (i - 1) * 1.01/count_bins;
  edges(count_bins + 1) = 1.01;
  [n, m] = size(red);
  h = zeros(n, m);
  s = zeros(n, m);
  v = zeros(n, m);
  [red, green, blue] = convert2hsv(red, green, blue);
  sol_red = histc((red')(:)', edges);
  sol_red(length(sol_red)) = [];
  sol_green = histc((green')(:)', edges);
  sol_green(length(sol_green)) = [];
  sol_blue = histc((blue')(:)', edges);
  sol_blue(length(sol_blue)) = [];
  sol = [sol_red sol_green sol_blue];
end