<<<<<<< HEAD
function [x_sinc] = I_sinc(t)
  x = 2*pi*0.5*t;
  x_sinc = sin(x) ./ x;   % caso x =! 0
  x_sinc(x == 0) = 1;     % caso x=0
end
=======
function [x_sinc] = I_sinc(t)
  x = 2*pi*0.5*t;
  x_sinc = sin(x) ./ x;   % caso x =! 0
  x_sinc(x == 0) = 1;     % caso x=0
end
>>>>>>> 9599ffc15993d9c5acd7ce68139590d11d42275c
