function [h, s, v] = convert2hsv(r, g, b)
  r_n = double(r)/255.0;
  g_n = double(g)/255.0;
  b_n = double(b)/255.0;
  c_max = max(max(r_n, g_n), b_n);
  c_min = min(min(r_n, g_n), b_n);
  delta = c_max - c_min;
  h(find(delta == 0)) = 0;
  h(find(delta != 0 & c_max == r_n))= 60 * mod(((g_n - b_n)./delta)(find(delta !=0 & c_max == r_n)),6);
  h(find(delta != 0 & c_max == g_n))= 60 * ((((b_n - r_n)./delta) + 2)(find(delta !=0 & c_max == g_n)));
  h(find(delta != 0 & c_max == b_n))= 60 * ((((r_n - g_n)./delta) + 4)(find(delta !=0 & c_max == b_n)));
  h = h/360;
  s(find(c_max == 0)) = 0;
  s(find(c_max != 0)) = (delta./c_max)(find(c_max != 0));
  v = c_max;
endfunction