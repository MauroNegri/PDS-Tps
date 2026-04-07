function [t, c] = ondacuadrada(t_ini, t_fin, fm, fs, phi)
  T = 1/fm;
  t = t_ini:T:t_fin-T;

  x = 2*pi * fs * t + phi;

  c(mod(x, 2*pi) >= pi) = -1;
  c(mod(x, 2*pi) < pi) = 1;

end
