function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
  path_cats = strcat(path_to_dataset, "cats/");
  imgs_cats = getImgNames(path_cats);
  path_not_cats = strcat(path_to_dataset, "not_cats/");
  imgs_not_cats = getImgNames(path_not_cats);
  X = zeros(rows(imgs_cats) + rows(imgs_not_cats), count_bins * 3);
  y = [ones(1, rows(imgs_cats)) -ones(1, rows(imgs_not_cats))]';
  if histogram == "RGB"
    for i = 1:rows(imgs_cats)
      path_to_img = strcat(path_cats, imgs_cats(i, :));
      X(i, :) = rgbHistogram(path_to_img, count_bins);
    endfor
    for i = rows(imgs_cats) + 1:rows(X)
      path_to_img = strcat(path_not_cats, imgs_not_cats(i - rows(imgs_cats), :));
      X(i, :) = rgbHistogram(path_to_img, count_bins);
    endfor
  else
    for i = 1:rows(imgs_cats)
      path_to_img = strcat(path_cats, imgs_cats(i, :));
      X(i, :) = hsvHistogram(path_to_img, count_bins);
    endfor
    for i = rows(imgs_cats) + 1:rows(X)
      path_to_img = strcat(path_not_cats, imgs_not_cats(i - rows(imgs_cats), :));
      X(i, :) = hsvHistogram(path_to_img, count_bins);
    endfor
  endif
endfunction
