<<<<<<< HEAD
function [t, x] = senoidal(t_ini, t_fin, fm, fs, phi)

  T = 1 / fm;

  t = t_ini:T:t_fin-T;

  x =  sin(2*pi * fs * t + phi);

end

=======
function [t, x] = senoidal(t_ini, t_fin, fm, fs, phi)

  T = 1 / fm;

  t = t_ini:T:t_fin-T;

  x =  sin(2*pi * fs * t + phi);

end

>>>>>>> 9599ffc15993d9c5acd7ce68139590d11d42275c
