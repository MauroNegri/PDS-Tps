function [t, x] = senoidal(t_ini, t_fin, fm, fs, phi)

  T = 1 / fm;

  t = t_ini:T:t_fin-T;

  x =  sin(2*pi * fs * t + phi);

end

