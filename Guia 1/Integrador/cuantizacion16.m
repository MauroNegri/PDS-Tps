function [t_cuant, x_cuant] = cuantizacion16(t, x)

##  [t, x] = senoidal(t_ini, t_fin, fm, fs, phi, A);
## como la señal no tiene valores negativos no hace falta
## x_min = min(x);
## x_resta = x - x_min;

##  p(x_resta<0) = 0; % no va a ser menor a 0
##  p((0 <= x_resta) & (x_resta < (N-1)*H)) = H*int(x_resta/H);
##  p(x_resta >= (N-1)*H) = (N-1)*H;

  N = 16;
  H = max(x) / (N-1); # H = (x_max - x_min) / N
  p = zeros(size(x));
  for i = 1:length(x)
    if x(i) < 0
      p(i) = 0;
    elseif x(i) >= (N-1)*H
      p(i) = (N-1)*H;
    else
      p(i) = H * round(x(i) / H);
    endif
  endfor

  x_cuant = p;
  t_cuant = t;
end
