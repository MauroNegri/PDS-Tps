<<<<<<< HEAD
function [t, x] = inversion(t_ini, t_fin, fm, fs, phi)

  [t, x] = senoidal(t_ini, t_fin, fm, fs, phi);

  u = length(x);
  i = 1;
  while (i < u)
    aux = x(u);
    x(u) = x(i);
    x(i) = aux;

    i = i+1;
    u = u-1;
  endwhile

#  x = x(end:-1:1);
#  t = t(end:-1:1);
end


=======
function [t, x] = inversion(t_ini, t_fin, fm, fs, phi)

  [t, x] = senoidal(t_ini, t_fin, fm, fs, phi);

  u = length(x);
  i = 1;
  while (i < u)
    aux = x(u);
    x(u) = x(i);
    x(i) = aux;

    i = i+1;
    u = u-1;
  endwhile

#  x = x(end:-1:1);
#  t = t(end:-1:1);
end


>>>>>>> 9599ffc15993d9c5acd7ce68139590d11d42275c
