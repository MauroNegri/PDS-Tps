function [t_rect, x_rect] = rectificacion_completa(t, x)

##  [t, x] = senoidal(t_ini, t_fin, fm, fs, phi, A);

  for i = 1:length(x)
    if x(i) < 0
      x(i) = -x(i);  % si es negativo, lo invierte
    endif
  endfor
  x_rect = x;
  t_rect = t;
  #x_rect = abs(x);

end
