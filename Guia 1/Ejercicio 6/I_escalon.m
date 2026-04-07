function [y] = I_escalon(t)
  y = zeros(size(t));
  y(t >= 0 & t < 1) = 1;
end
