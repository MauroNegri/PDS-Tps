function [y] = I_lineal(t)
  y = zeros(size(t));
  y(abs(t) < 1) = 1 - abs(t);
##  y(abs(t) < 1) = 1 - abs(t(abs(t) < 1));

end
