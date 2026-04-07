function [t, x] = rectificacion(t_ini, t_fin, fm, fs, phi)

  [t, x] = senoidal(t_ini, t_fin, fm, fs, phi);

  for i = 1:length(x)
    if x(i) < 0
      x(i) = -x(i);  % si es negativo, lo invierte
    endif
  endfor

##  x_rect = abs(x);

## de media onda
##  for i = 1:length(x)
##    if x(i) < 0
##      x(i) = 0;  % si es negativo, se pone en 0
##    endif
##  endfor

##  x(x<0) = 0;
##  x_rect = x;
end
