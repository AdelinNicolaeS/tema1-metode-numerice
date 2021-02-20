function [sol] = rgbHistogram(path_to_image, count_bins)
  % obtin fiecare culoare
  image = imread(path_to_image);
  red = image(:, :, 1);
  green = image(:, :, 2);
  blue = image(:, :, 3);
  sol = zeros(1, 3 * count_bins);
  i = 1:count_bins;
  edges = (i - 1) * 256/count_bins;
  edges(count_bins + 1) = 256;
  sol_red = histc((red')(:)', edges);
  sol_red(length(sol_red)) = [];
  sol_green = histc((green')(:)', edges);
  sol_green(length(sol_green)) = [];
  sol_blue = histc((blue')(:)', edges);
  sol_blue(length(sol_blue)) = [];
  sol = [sol_red sol_green sol_blue];
end