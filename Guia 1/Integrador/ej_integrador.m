A = 5;
fs = 10;
phi = pi/4;
fm = 400;
t_ini = 0;
t_fin = 0.2;
# Parte 1
[t_1, x_1] = senoidal(t_ini, t_fin, fm, fs, phi, A);

figure(1);
subplot(3,1,1);
plot(t_1, x_1);
title('Senoidal original');
xlabel('t1');
ylabel('x1');
axis([0 0.2 -6 6]);

[t_1_rect, x_1_rect] = rectificacion(t_1, x_1);
subplot(3,1,2);
plot(t_1_rect, x_1_rect);
title('Senoidal rectificada');
xlabel('t1 rect');
ylabel('x1 rect');
axis([0 0.2 0 6]);

[t_1_cuant, x_1_cuant] = cuantizacion16(t_1_rect, x_1_rect);
subplot(3,1,3);
plot(t_1_cuant, x_1_cuant);
title('Senoidal cuantificada');
xlabel('t1 cuant');
ylabel('x1 cuant');
axis([0 0.2 0 6]);

# Parte 2
x_2_ruido1 = senal_ruido(length(x_1_cuant), 0.5);  # poco ruido
x_2_ruido2 = senal_ruido(length(x_1_cuant), 5);    # mucho ruido

x_2_total1 = x_1_cuant + x_2_ruido1;
x_2_total2 = x_1_cuant + x_2_ruido2;

figure(2);
subplot(3,1,1);
plot(t_1_cuant, x_1_cuant);
title('Senoidal cuantizada original');
xlabel('t1 cuant');
ylabel('x1 cuant');

subplot(3,1,2);
plot(t_1_cuant, x_2_total1);
title('Senoidal cuantizada con ruido 1');
xlabel('t1 cuant');
ylabel('x1 cuant ruido');

subplot(3,1,3);
plot(t_1_cuant, x_2_total2);
title('Senoidal cuantizada con ruido 2');
xlabel('t1 cuant');
ylabel('x1 cuant ruido');

Ps = mean(x_1_cuant.^2); # Potencia de la señal
Pr1 = mean(x_2_ruido1.^2); # Potencia del ruido 1
Pr2 = mean(x_2_ruido2.^2); # Potencia del ruido 2

disp('La potencia de la señal es: '), disp(Ps);
disp('La potencia del ruido 1 es: '), disp(Pr1);
disp('La potencia del ruido 2 es: '), disp(Pr2);


# Constante para que SNR = 0 dB
# 10*log(Ps / c^2*Pr) = 6
# log(Ps / c^2*Pr) = 6/10
# Ps / c^2*Pr = 10^(6/10)
# c^2*Pr = Ps/10^(6/10)
# c^2 = Ps/(Pr*10^(6/10))
# c = sqrt(Ps/(Pr*10^(6/10)))

c1 = sqrt(Ps/(Pr1*10^(6/10)));
c2 = sqrt(Ps/(Pr2*10^(6/10)));

x_2_ruido1_c1 = x_2_ruido1*c1;
x_2_ruido2_c2 = x_2_ruido2*c2;
Pr1_6db = mean(x_2_ruido1_c1.^2);
Pr2_6db = mean(x_2_ruido2_c2.^2);

SNRdb1_6db = 10*log10(Ps / Pr1_6db);
SNRdb2_6db = 10*log10(Ps / Pr2_6db);

disp('La potencia del ruido 1 para que SNR sea 6: '), disp(Pr1_6db);
disp('La relación señal ruido 1 para que SNR sea 6 es: '), disp(SNRdb1_6db);
disp('La potencia del ruido 2 para que SNR sea 6: '), disp(Pr2_6db);
disp('La relación señal ruido 2 para que SNR sea 6 es: '), disp(SNRdb2_6db);

# Parte 3
fs = 10;
phi = pi/4;
fm = 15;
t_ini = 0;
t_fin = 0.2;

[t_3, x_3] = senoidal(t_ini, t_fin, fm, fs, phi, A);

figure(3);
subplot(3,1,1);
plot(t_3, x_3);
title('Senoidal original');
xlabel('t1');
ylabel('x1');

[t_3_rect, x_3_rect] = rectificacion(t_3, x_3);
subplot(3,1,2);
plot(t_3_rect, x_3_rect);
title('Senoidal rectificada');
xlabel('t1 rect');
ylabel('x1 rect');

[t_3_cuant, x_3_cuant] = cuantizacion16(t_3_rect, x_3_rect);
subplot(3,1,3);
plot(t_3_cuant, x_3_cuant);
title('Senoidal cuantificada');
xlabel('t1 cuant');
ylabel('x1 cuant');
