<<<<<<< HEAD
function [t, x_sinc] = sinc(t_ini, t_fin, fm, fs, phi)
  T = 1/fm;
  t = t_ini:T:t_fin-T;
  x = 2*pi*fs*t;
  x_sinc = sin(x) ./ x;   # caso x =! 0
  x_sinc(x == 0) = 1;     # caso x=0
##  idx = (x != 0);
##  x_sinc(idx) = sin(x(idx)) ./ (x(idx));

##    T = 1/fm;
##    t = t_ini:T:t_fin-T;
##    x = (2*pi*fs*t)+phi;
##    x_sinc = sin(x) ./ (x + (x==0)) + (x==0);

end
=======
function [t, x_sinc] = sinc(t_ini, t_fin, fm, fs, phi)
  T = 1/fm;
  t = t_ini:T:t_fin-T;
  x = 2*pi*fs*t;
  x_sinc = sin(x) ./ x;   # caso x =! 0
  x_sinc(x == 0) = 1;     # caso x=0

end
>>>>>>> 9599ffc15993d9c5acd7ce68139590d11d42275c
