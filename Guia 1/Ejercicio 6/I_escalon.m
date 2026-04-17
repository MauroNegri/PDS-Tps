<<<<<<< HEAD
function [y] = I_escalon(t)
  y = zeros(size(t));
  y(t >= 0 & t < 1-1e-12) = 1;
end
=======
function [y] = I_escalon(t)
  y = zeros(size(t));
  y(t >= 0 & t < 1) = 1;
end
>>>>>>> 9599ffc15993d9c5acd7ce68139590d11d42275c
