<<<<<<< HEAD
% fs = 5hz fm >= 2*fs
% t_fin = 1 s
% fm = 100, 25, 10, 4, 1 y 0,5 Hz

% ¿En qué casos la cantidad de ciclos que observa se corresponde con una sinusoidal de 5 Hz?
% ¿A qué se deben lasdiscrepancias encontradas?
t_ini = 0;
t_fin = 1;
fs = 5;
fm = [100 25 10 4 1 0.5];

for i = 1:length(fm)
  [t, x] = senoidal(t_ini, t_fin, fm(i), fs, 0);
  figure(i);
  plot(t,x)
end

[t, x] = senoidal(t_ini, t_fin, 10, 5, 0);
figure(7);
plot(t,x)
hold on;
stem(t,x);
hold off;
% En las graficas de fm = 100, 25 se ven exacamente los 5 ciclos de los 5 hz
% Pero a partir de fm = 10 se dejan de ver los 5 ciclos
% y la grafica se empieza a deformar hasta que en los dos ultimos practicamente no se ve
% con menos muestras menos informacion puedo obtener por ciclo?


=======
% fs = 5hz fm >= 2*fs
% t_fin = 1 s
% fm = 100, 25, 10, 4, 1 y 0,5 Hz

% ¿En qué casos la cantidad de ciclos que observa se corresponde con una sinusoidal de 5 Hz?
% ¿A qué se deben lasdiscrepancias encontradas?
t_ini = 0;
t_fin = 1;
fs = 5;
fm = [100 25 10 4 1 0.5];

for i = 1:length(fm)
  [t, x] = senoidal(t_ini, t_fin, fm(i), fs, 0);
  figure(i);
  plot(t,x)
end

% En las graficas de fm = 100, 25 se ven exacamente los 5 ciclos de los 5 hz
% Pero a partir de fm = 10 se dejan de ver los 5 ciclos
% y la grafica se empieza a deformar hasta que en los dos ultimos practicamente no se ve
% con menos muestras menos informacion puedo obtener por ciclo?


>>>>>>> 9599ffc15993d9c5acd7ce68139590d11d42275c
