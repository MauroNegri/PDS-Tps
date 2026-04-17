<<<<<<< HEAD
function [y] = I_lineal(t)
  y = zeros(size(t));
  y(abs(t) < 1) = 1 - abs(t);
##  y(abs(t) < 1) = 1 - abs(t(abs(t) < 1));

end
=======
function [y] = I_lineal(t)
  y = zeros(size(t));
  y(abs(t) < 1) = 1 - abs(t);
##  y(abs(t) < 1) = 1 - abs(t(abs(t) < 1));

end
>>>>>>> 9599ffc15993d9c5acd7ce68139590d11d42275c
