% fs = 4000hz
% t_fin = 2 s
% fm = 129 Hz

% Grafique el resultado y estime la frecuencia de la onda sinusoidal que se
% observa en la figura. Analice y obtenga conclusiones.

fs = 4000;
t_ini = 0;
t_fin = 2;
fm = 129;

[t, x] = senoidal(t_ini, t_fin, fm, fs, 0);
figure(1);
plot(t,x);

% 33: 0.99993 inicio ciclo 0.2481 s
% 162: 0.99993 fin ciclo 1.2481 s

##T = 1.2481 - 0.2481 = 1
##f = 1/ T = 1 / 1 = 1 hz

% cuando la frecuencia es muy grande 4000hz y la frecuencia de muestreo es muy baja
% la señal es irreconosible, el aliasing hace que sea de 1hz
