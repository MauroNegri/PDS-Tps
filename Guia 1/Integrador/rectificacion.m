<<<<<<< HEAD
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
=======
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
>>>>>>> 9599ffc15993d9c5acd7ce68139590d11d42275c
